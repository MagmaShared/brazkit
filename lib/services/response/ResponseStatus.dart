
import 'dart:convert';

class ResponseStatus<T> {

  final bool success;
  final String messageSuccess;
  final String messageError;
  final String techError;
  final T body;

  get message => _toMessage;

  ResponseStatus(this.success, {this.messageSuccess, this.messageError, this.body, this.techError});

  factory ResponseStatus.fromJson(bool success, Map<String, dynamic> data) {

    if (data == null) return null;

    ResponseStatus responseStatus = ResponseStatus(
      success,
      messageSuccess: data['messageSuccess'] as String,
      messageError: data['messageError'],
      techError: data['techError'],
      body: data['data'],
    );

    return responseStatus;
  }

  Map toJson() => {
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





