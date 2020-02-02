import 'dart:async';

import 'package:brazkit/widget/global_dialog/global_dialog_request.dart';
import 'package:brazkit/widget/global_dialog/global_dialog_response.dart';

class GlobalDialogService {

  static final GlobalDialogService _instance = GlobalDialogService._internal();
  GlobalDialogService._internal();
  factory GlobalDialogService() => _instance;

  Function(GlobalDialogRequest) _showDialogListener;
  Completer<GlobalDialogResponse> _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(GlobalDialogRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<GlobalDialogResponse> showDialog({
    String title,
    String description,
    String buttonTitle = 'Ok',
  }) {

    if (_dialogCompleter != null && _dialogCompleter.isCompleted == false) _dialogCompleter.complete();
    
    _dialogCompleter = Completer<GlobalDialogResponse>();
    _showDialogListener(GlobalDialogRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter.future;
  }
  
  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(GlobalDialogResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}