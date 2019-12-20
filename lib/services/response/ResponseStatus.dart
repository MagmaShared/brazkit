import 'dart:convert';

class ResponseStatus<T> {
  final int statusCode;
  final bool success;
  String messageSuccess;
  String messageError;
  String debugError;
  T data;
  String body;

  get message => _toMessage;

  ResponseStatus(this.statusCode,
      {this.success, this.messageError, this.messageSuccess, this.debugError, dynamic data});

  factory ResponseStatus.fromJson(int statusCode, dynamic data, {bool success, String messageError}) {
    // bool isSuccess = success != null
    //     ? success
    //     : statusCode.toString().startsWith('2') ? true : false;

    ResponseStatus responseStatus;

    if (data == null) {
      responseStatus = ResponseStatus(statusCode, success: success ?? true);
    } else {
      try {
        if ('List<dynamic>' == data.runtimeType.toString()) {
          responseStatus = ResponseStatus<List<dynamic>>(statusCode, success: success ?? true);
        } else if ('Map<String, dynamic>' == data.runtimeType.toString()) {
          responseStatus = ResponseStatus<Map<String, dynamic>>(statusCode, success: data['success'] != null ? data['success'] : true);
          responseStatus.messageSuccess = data['messageSuccess'];
          responseStatus.messageError = messageError ?? data['messageError'] as String;
          responseStatus.debugError = data['debugError'] as String;
          responseStatus.data = data['data'];
        } else {
          responseStatus = ResponseStatus<dynamic>(statusCode, success: data['success'] != null ? data['success'] : true);
          responseStatus.messageSuccess = data['messageSuccess'];
          responseStatus.messageError = messageError ?? data['messageError'] as String;
          responseStatus.debugError = data['debugError'] as String;
          responseStatus.data = data['data'];
        }
      } catch (e) {
        rethrow;
      }
    }

    try {
      responseStatus.body = json.encode(data);      
    } catch (e) {}

    return responseStatus;
  }

  Map toJson() => {
        "success": success.toString(),
        "statusCode": statusCode,
        "messageSuccess": messageSuccess.toString(),
        "messageError": messageError.toString(),
        "debugError": debugError.toString(),
        "data": json.encode(data),
        "body": body,
      };

  String _toMessage() {
    return success ? this.messageSuccess : this.messageError;
  }

  bool hasData() {
    return this.data != null;
  }

  bool hasBody() {
    return (this.body != null && this.body.isNotEmpty);
  }
}
