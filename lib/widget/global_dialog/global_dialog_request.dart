import 'package:flutter/widgets.dart';
class GlobalDialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  GlobalDialogRequest({
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
  });
}