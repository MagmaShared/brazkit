import 'package:flutter/material.dart';

class BrazErrorKit {
  static reportError(String error,
      {String whenError = "", String whereError = "FLUTTER_ERROR"}) {
    FlutterError.reportError(FlutterErrorDetails(
      exception: FlutterError(error),
      context: ErrorDescription(whenError),
      library: whereError,
    ));
  }

  static setOnFlutterFrameworkErrorCallback(
      Function(FlutterErrorDetails) flutterErrorDetails) {
    FlutterError.onError = flutterErrorDetails;
  }

  static throwError(String message, {int maxCharacter = 800}) {
    throw message?.substring(0, maxCharacter) ?? 'Undefined Error...';
  }
}

/// Use case:
/// try {
///   throw BrazException(AppErrors.NO_AUTH);
/// } on BrazException catch(e) {
///   print(e);
/// } catch (e) {
///   rethrow;
/// }
class BrazException implements Exception {
  final Object _e;
  final String titleMessage;
  BrazException([this._e, this.titleMessage = "Ocorreu um erro:"]);

  @override
  String toString() {
    return '${_e.toString() ?? "Erro desconhecido."}';
  }
}
