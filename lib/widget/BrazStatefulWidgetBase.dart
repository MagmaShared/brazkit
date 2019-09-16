import 'package:flutter/material.dart';

class BrazStatefulWidgetBase extends StatefulWidget {
  @override
  _BrazStatefulWidgetBaseState createState() => _BrazStatefulWidgetBaseState();
}

class _BrazStatefulWidgetBaseState extends State<BrazStatefulWidgetBase> {

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

//    validar necessidade
//    executar uma função depois do método build() terminar?
//    SchedulerBinding.instance.addPostFrameCallback((_) => this._onLoad());
  }
}
