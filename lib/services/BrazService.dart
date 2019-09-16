import 'dart:convert';
import 'package:brazkit/services/response/ResponseStatus.dart';
import 'package:brazkit/utils/BrazNetworkKit.dart';
//import 'package:http/http.dart' as http;

class BrazService {

//  static Future<ResponseStatus> post(url, {body, headers}) async {
//
//    _checkConnectivity();
//
//    final response = await  http.post(url, body: body, headers: headers);
//    return _buildResponseStatus(response);
//
//  }
//
//  static _checkConnectivity() async {
//    bool isConnected = await BrazNetworkKit.isConnected();
//    if (!isConnected){
//      // todo abrir dialogo exibindo o erro
//      throw 'Sem conexão com internet.';
//    }
//  }
//
//  static ResponseStatus _buildResponseStatus(http.Response response){
//    try {
//      return ResponseStatus.fromJson(response.statusCode, json.decode(response.body), success: response.statusCode == 200);
//    } catch (error) {
//        return  ResponseStatus(response.statusCode, messageError: error);
//      // todo abrir dialogo exibindo o erro
//    }
//  }
}
