import 'package:flutter/material.dart';

class StatefulWidgetBase extends StatefulWidget {
  @override
  _StatefulWidgetBaseState createState() => _StatefulWidgetBaseState();
}

class _StatefulWidgetBaseState extends State<StatefulWidgetBase> {

  void Function() _onLoad;
  set onLoad(Function() func){
    this._onLoad = func;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();

//    executar uma função depois do método build() terminar?
//    SchedulerBinding.instance.addPostFrameCallback((_) => this._onLoad());
  }
}
