import 'dart:convert';
import 'package:brazkit/src/services/response/ResponseStatus.dart';
import 'package:brazkit/src/utils/networkkit.dart';
import 'package:http/http.dart' as http;

class DirtyService {

  static Future<ResponseStatus> post(url, {body, headers}) async {

    _checkConnectivity();

    final response = await  http.post(url, body: body, headers: headers);
    return _buildResponseStatus(response);

  }

  static _checkConnectivity() async {
    bool isConnected = await NetworkKit.isConnected();
    if (!isConnected){
      //mostrar alerta
      throw 'Sem conexão com internet.';
    }
  }

  static ResponseStatus _buildResponseStatus(http.Response response){
    try {
      ResponseStatus rs;
      if (response.statusCode == 200) {
        rs = ResponseStatus.fromJson(true, json.decode(response.body));
      } else {
        rs = ResponseStatus.fromJson(false, json.decode(response.body));
      }
      return rs;
    } catch (error) {
      ResponseStatus rs = ResponseStatus(false, messageError: error);
      return rs;
      // todo abrir dialogo exibindo o erro
    }
  }
}