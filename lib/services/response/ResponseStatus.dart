
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class ResponseStatus<T> {

  final int statusCode;
  final bool success;
  final String messageSuccess;
  final String messageError;
  final String techError;
  final T body;

  get message => _toMessage;

  ResponseStatus({@required this.success, @required this.statusCode, this.messageSuccess, this.messageError, this.body, this.techError});

  factory ResponseStatus.fromJson(bool success, int statusCode, Map<String, dynamic> data) {

    if (data == null) return null;

    ResponseStatus responseStatus = ResponseStatus(
      success: success,
      statusCode: statusCode,
      messageSuccess: data['messageSuccess'] as String,
      messageError: data['messageError'],
      techError: data['techError'],
      body: data['data'],
    );

    return responseStatus;
  }

  Map toJson() => {
    "success": success.toString(),
    "statusCode": statusCode.toString(),
    "messageSuccess": messageSuccess.toString(),
    "messageError": messageError.toString(),
    "techError": techError.toString(),
    "body": json.encode(body),
  };

  String _toMessage(){
    return success ? this.messageSuccess : this.messageError;
  }

  bool hasData() {
    return this.body != null;
  }

//fromMap

}





