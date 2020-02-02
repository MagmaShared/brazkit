
import 'package:brazkit/utils/BrazAlertKit.dart';
import 'package:brazkit/widget/global_dialog/global_dialog_request.dart';
import 'package:brazkit/widget/global_dialog/global_dialog_response.dart';
import 'package:brazkit/widget/global_dialog/global_dialog_service.dart';
import 'package:flutter/material.dart';

class GlobalDialogWidget extends StatefulWidget {
  
  final Widget child;
  GlobalDialogWidget({Key key, this.child}) : super(key: key);

  _GlobalDialogWidgetState createState() => _GlobalDialogWidgetState();
}
class _GlobalDialogWidgetState extends State<GlobalDialogWidget> {
  
  @override
  void initState() {
    super.initState();
    GlobalDialogService().registerDialogListener(_showDialog);
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(GlobalDialogRequest request) {
    BrazAlertKit.showAlertDialog(
      context, 
      request.description,
      title: request.title,
      dismissible: false,
      callback: (){GlobalDialogService().dialogComplete(GlobalDialogResponse(confirmed: true));}
    );
  }
}