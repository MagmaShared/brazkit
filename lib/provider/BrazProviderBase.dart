import 'package:flutter/material.dart';

class BrazProviderBase extends ChangeNotifier {
  
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setViewState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}

enum ViewState { Idle, Busy }