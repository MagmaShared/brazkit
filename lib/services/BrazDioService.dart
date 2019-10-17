import 'dart:convert';
import 'dart:io';

import 'package:brazkit/services/response/ResponseStatus.dart';
import 'package:dio/dio.dart';

class BrazDioService {

  bool debugMode;
  int receiveTimeout;
  int connectTimeout;
  String _endpoint;
  Options _dioOptions;

  static final BrazDioService _instance = BrazDioService._internal();
  BrazDioService._internal();

  factory BrazDioService() {
    return _instance;
  }

  BrazDioService config(endpoint, {debugMode = false, receiveTimeout = 5000, connectTimeout = 5000, Map<String, dynamic> headers}) {
    this._endpoint = endpoint;
    this.debugMode = debugMode;
    this._dioOptions = Options(receiveTimeout: this.receiveTimeout, connectTimeout: this.connectTimeout, headers: headers);
    return this;
  }

  Future<ResponseStatus> get(String path, {Map<String, dynamic> params}) async {
    Response response;
    try {
      response = await dioInstance().get('$_endpoint$path', data: params);
      return ResponseStatus.fromJson(response.statusCode, response.statusCode == 204 ? null : response.data);
    } catch (error, stacktrace) {
      _print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseStatus(response?.statusCode ?? 500, messageError: _handleError(error), success: false);
    }
  }

  Future<ResponseStatus> post(String path, {Map<String, dynamic> params}) async {
    Response response;
    try {
      if (params != null) jsonEncode(params);
    } catch (e) {
      return ResponseStatus(400, messageError: 'Invalid Paremeters', debugError: e.toString());
    }

    try {
      Dio d = dioInstance();
      d.options.contentType=ContentType.parse("application/json");
      response = await d.post('$_endpoint$path', data: params);
      return ResponseStatus.fromJson(response.statusCode, response.statusCode == 204 ? null : response.data);
    } catch (error, stacktrace) {
      _print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseStatus(response?.statusCode ?? 500,  debugError: stacktrace.toString(), messageError: _handleError(error), success: false);
    }
  }
  
  Future<ResponseStatus> postFile(String path, FormData formData) async {
    Response response;
    try {
      Dio d = dioInstance();
      d.options.contentType=ContentType.parse("multipart/form-data");
      response = await d.post('$_endpoint$path', data: formData);
      return ResponseStatus.fromJson(response.statusCode, response.data);
    } catch (error, stacktrace) {
      _print("Exception occured --> $error stackTrace: $stacktrace");
      return ResponseStatus(response?.statusCode ?? 500, messageError: _handleError(error), debugError: response.toString(), success: false);
    }
  }

  Dio dioInstance(){
    Dio dio = Dio(this._dioOptions);
    this._setupInterceptors(dio);
    return dio;
  }

  void _setupInterceptors(Dio dio) {
    _onRequest(dio);
    _onResponse(dio);
  }
  _onRequest(Dio dio) {
    this._logRequest(dio.options);
    dio.interceptor.request.onSend = (Options options) async {
      // todo implementar logica de token
//      Response response = await dio.get("/token");
//      options.headers["token"] = response.data["data"]["token"];
      return options; //continue
    };
  }
  _onResponse(Dio dio){
    dio.interceptor.response.onSuccess = (Response response) {
      _logResponse(dio.options, response);
    };
  }

  void _logRequest(Options options) {
    if (this.debugMode) {
      _print("--> REQUEST HTTP");
      _print("--> Method: ${options.method} Path: ${options.path}");
      _print("--> Content type: ${options.contentType}");
    }
  }

  void _logResponse(Options options, Response response){
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
  String _handleError(Error error) {
    String errorDescription = "";
    if (error == null) return 'Undefined Error.';
    if (error is DioError) {
      switch (error.type) {
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
          errorDescription = "Erro ${error.response.statusCode}: ${error.message}";
          break;
      }
    } else {
      errorDescription = "Ocorreu um erro inesperado.";
    }
    return errorDescription;
  }

}