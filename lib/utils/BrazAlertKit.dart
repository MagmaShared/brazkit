import 'dart:async';
import 'package:flutter/material.dart';

class BrazAlertKit {

  static showSnackbar(ScaffoldState scaffoldState, String message,
      [MaterialColor materialColor, int duration = 3]) {
    if (message.isEmpty) return;
    // Find the Scaffold in the Widget tree and use it to show a SnackBar
//    Scaffold.of(context).showSnackBar(
    scaffoldState.removeCurrentSnackBar();
    scaffoldState.showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: materialColor,
        duration: Duration(seconds: duration)));
  }

  static showSnackbarLoading(BuildContext context, {int seconds = 90, Color backgroundColor, String message}){

    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(

      SnackBar(
        content: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new CircularProgressIndicator(),
            ),
            new Text("  Aguarde...")
          ],
        ),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: seconds))

    );
  }

  static Future<bool> showConfirmDialog(BuildContext context, String message,
      {String title = "Mensagem",
      String buttonOkText = "OK",
      String buttonCancelText = "CANCELAR",
      VoidCallback callbackOk,
      VoidCallback callbackCancel,
      bool dismissible = true}) async {
    return showDialog<bool>(
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
              child: Text(buttonCancelText),
              onPressed: () {
                Navigator.of(context).pop(false);
                if (callbackCancel != null) callbackCancel();
              },
            ),
            FlatButton(
              child: Text(buttonOkText),
              onPressed: () {
                Navigator.of(context).pop(true);
                if (callbackOk != null) callbackOk();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertDialog(BuildContext context, String message,
    {
      String title,
      String buttonText = "OK",
      bool dismissible = true,
      VoidCallback callback
    }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(message)],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(buttonText),
              onPressed: () {
                if (callback != null) callback();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showGenericLoader(BuildContext context, {bool dismissible = false,  Widget child}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible, // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child: child ?? CircularProgressIndicator(),
        );
      },
    );
  }

  static void showListTile(
      BuildContext context, String title, List<ListTile> listTile) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(title),
            children: listTile,
          );
        });
  }

  static void showBottomSheet(
      BuildContext context, String title, List<Widget> widgets) {
    List<Widget> list = [
      Padding(
        padding: EdgeInsets.all(12),
        child: Text(title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      ...widgets
    ];

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: list);
        });
  }

  static void showSimpleBottomSheetWidget(BuildContext context, Widget widget) {
   
    showModalBottomSheet(
       shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)
          )
        ),
        context: context,
        builder: (context) {
          return widget;
        });
  }

  static void showModalBottomSheetScafold(BuildContext context, Widget child,
      {String title = ''}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: .88,
            child: Scaffold(                            
            appBar: new AppBar(
              automaticallyImplyLeading: false,
              actions: <Widget>[
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              // leading: Container(
              //     margin: const EdgeInsets.all(8),
              //     child: Icon(BrazFontKit.fontAwesome5IconData(
              //         FontAwesome5Type.robot))),
              // centerTitle: true,
              title: new Text(title),
            ),
            body: Container(
              child: child
            ),
          ),
          );
        });
  }

  static void showBottomSheetFloat(String message, ScaffoldState scaffoldState){
    scaffoldState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
          backgroundColor: Colors.blueAccent,
          behavior: SnackBarBehavior.floating,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      );
  }

  static _MessageInCenterWidget messageInCenter(String message) {
    return _MessageInCenterWidget(message);
  }

  static Future<String> inputText(
      BuildContext context, String title, String hint) async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog<String>(
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
    return showDialog<bool>(
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
      child:
          Text(_message, style: TextStyle(fontSize: 16, color: Colors.black)),
    );
  }
}
  