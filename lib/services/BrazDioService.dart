import 'dart:convert';
import 'dart:io';

import 'package:alice/alice.dart';
import 'package:brazkit/services/response/ResponseStatus.dart';
import 'package:dio/dio.dart';

class BrazDioService {

  bool debugMode;
  int receiveTimeout;
  int connectTimeout;
  String _endpoint;
  BaseOptions _dioOptions;
  String _currentPath;
  Alice _alice;
  bool Function(int) _validateStatus = (status) {return true;};

  static final BrazDioService _instance = BrazDioService._internal();
  BrazDioService._internal();

  factory BrazDioService() {
    return _instance;
  }

  void setAliceInstance(Alice alice){
    this._alice = alice;
  }

  BrazDioService config(endpoint, {debugMode = false, receiveTimeout = 5000, connectTimeout = 5000, Map<String, dynamic> headers}) {
    this._endpoint = endpoint;
    this.debugMode = debugMode;
    this._dioOptions = BaseOptions(receiveTimeout: this.receiveTimeout, connectTimeout: this.connectTimeout, headers: headers);
    dioInstance().options.validateStatus = this._validateStatus;
    return this;
  }

  void set validateStatus(bool Function(int) vstatus){
    this._validateStatus = vstatus;
    dioInstance().options.validateStatus = this._validateStatus;
  }

  Future<ResponseStatus> get(String path, {Map<String, dynamic> params}) async {

    this._currentPath = 'GET: ${path}';

    Response response;
    try {
      Dio d = dioInstance();
      response = await d.get('$_endpoint$path', queryParameters: params);
      return ResponseStatus.fromJson(response.statusCode, response.statusCode == 204 ? null : response.data);
    } catch (error, stacktrace) {
      _print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseStatus(response?.statusCode ?? 500, messageError: _handleError(error), success: false);
    }
  }

  Future<ResponseStatus> post(String path, {Map<String, dynamic> params}) async {
    
    this._currentPath = 'POST: ${path}';

    Response response;
    try {
      if (params != null) jsonEncode(params);
    } catch (e) {
      return ResponseStatus(400, messageError: 'Invalid Paremeters', debugError: e.toString());
    }

    try {
      Dio d = dioInstance();
      d.options.contentType = Headers.jsonContentType; //ContentType.parse("application/json");
      response = await d.post('$_endpoint$path', data: params);
      return ResponseStatus.fromJson(response.statusCode, response.statusCode == 204 ? null : response.data);
    } catch (error, stacktrace) {
      _print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseStatus(response?.statusCode ?? 500,  debugError: stacktrace.toString(), messageError: _handleError(error), success: false);
    }
  }
  
  Future<ResponseStatus> postFile(String path, FormData formData) async {
    
    this._currentPath = 'POST_FILE: ${path}';
    
    Response response;
    try {
      Dio d = dioInstance();
      d.options.contentType = ContentType.parse("multipart/form-data").toString();
      response = await d.post('$_endpoint$path', data: formData);
      return ResponseStatus.fromJson(response.statusCode, response.data);
    } catch (error, stacktrace) {
      _print("Exception occured --> $error stackTrace: $stacktrace");
      return ResponseStatus(response?.statusCode ?? 500, messageError: _handleError(error), debugError: response.toString(), success: false);
    }
  }

  Dio dioInstance(){
    Dio dio = Dio(this._dioOptions);
    
    dio.interceptors.clear();
    this._setupInterceptors(dio);
    if (debugMode)
      if (this._alice != null) dio.interceptors.add(this._alice.getDioInterceptor());

    return dio;
  }

  void _setupInterceptors(Dio dio) {
    
    // ON REQUEST and RESPONSE
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        this._logRequest(dio.options);
        return options;
        },
      onResponse:(Response response) {
          _logResponse(dio.options, response);
          return response; // continue
        }
      )
    );

  }

  void _logRequest(BaseOptions options) {
    if (this.debugMode) {
      _print("--> REQUEST BASE URL: ${this._endpoint} ");
      _print("--> METHOD AND PATH: ${this._currentPath} ");
      _print("--> HEADERS: ${options.headers.toString()}");
    }
  }

  void _logResponse(BaseOptions options, Response response){
    int maxCharactersPerLine = 800;
    _print("<-- STATUS_CODE: ${response.statusCode} ${response.request.method} ${response.request.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      _print('<-- RESPONSE: ${responseAsString.substring(0, maxCharactersPerLine)} ...');
    } else {
      _print('<-- RESPONSE: ${response.data}');
    }
    _print("<-- END HTTP");
  }

  void _print(Object object){
    if (this.debugMode ?? false) print(object);
  }

  String _handleError(dynamic dioError) {

    if (dioError is String) return dioError;
    
    String errorDescription = "";
    if (dioError == null) return 'Undefined Error.';
    if (dioError is DioError) {
      switch (dioError.error) {
        case DioErrorType.CANCEL:
          errorDescription = "Requisição para API foi cancelada.";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Tempo de tentantiva de conexão com API esgotada.";
          break;
        case DioErrorType.DEFAULT:
          errorDescription = "Conexão com API falhou devido a problemas com a acesso a internet.";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Tempo de resposta com a API esgotado.";
          break;
        case DioErrorType.RESPONSE:
          errorDescription = "Erro ${dioError.response.statusCode}: ${dioError.message}";
          break;
      }
    } else {
      errorDescription = "Ocorreu um erro inesperado.";
    }
    return errorDescription;
  }

}