import 'dart:async';
import 'package:flutter/material.dart';

class BrazAlertKit {

  static showSnackbar(ScaffoldState scaffoldState, String message, [MaterialColor materialColor, int duration = 3]) {
    if (message.isEmpty) return;
    // Find the Scaffold in the Widget tree and use it to show a SnackBar
//    Scaffold.of(context).showSnackBar(
    scaffoldState.removeCurrentSnackBar();
    scaffoldState.showSnackBar(
        SnackBar(content: Text(message),
            backgroundColor: materialColor,
            duration: Duration(seconds: duration))
    );
  }

  static Future<void> showAlertDialog(BuildContext context,
      String message,
      {
        String title = "Mensagem",
        String buttonText = "OK",
        bool dismissible = true
      }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(message)],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showListTile(BuildContext context, String title,
      List<ListTile> listTile) {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title: Text(title),
        children: listTile,
      );
    });
  }

  static void showBottomSheet(BuildContext context, String title,
      List<Widget> widgets) {
    List<Widget> list = [
      Padding(
        padding: EdgeInsets.all(12),
        child: Text(
            title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      ...widgets
    ];

    showModalBottomSheet(context: context, builder: (context) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          children: list
      );
    });
  }

  static _MessageInCenterWidget messageInCenter(String message) {
    return _MessageInCenterWidget(message);
  }

  static Future<String> inputText(BuildContext context, String title, String hint) async {

    TextEditingController _textFieldController = TextEditingController();

    return showDialog<String> (
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: TextField(
              maxLength: 30,
              autofocus: true,
              controller: _textFieldController,
              decoration: InputDecoration(hintText: hint),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(_textFieldController.text);
                },
              )
            ],
          );
        });
  }

  static Future<bool> isOk(BuildContext context, String title) async {
    return showDialog<bool> (
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

}

// internal class
class _MessageInCenterWidget extends StatelessWidget {
  final String _message;
  _MessageInCenterWidget(this._message);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_message,
          style:
          TextStyle(fontSize: 16, color: Colors.black)),
    );
  }
}