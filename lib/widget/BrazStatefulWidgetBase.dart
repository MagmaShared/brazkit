import 'package:flutter/material.dart';
import 'package:brazkit/bloc/BlocBase.dart';

Type _typeOf<T>() => T;

class BrazBlocProvider<T extends BlocBase > extends StatefulWidget {
  BrazBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BrazBlocProviderState<T> createState() => _BrazBlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BrazBlocProviderInherited<T>>();
    _BrazBlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class _BrazBlocProviderState<T extends BlocBase> extends State<BrazBlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _BrazBlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BrazBlocProviderInherited<T> extends InheritedWidget {
  _BrazBlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BrazBlocProviderInherited oldWidget) => false;
}

// class ExemploBloc extends BlocBase {
//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }
// }

// BrazBlocProvider(
//   bloc: ExemploBloc(),
//   child: Column(
//     children: <Widget>[
//       Child1(),
//       Child2(),
//     ],
//   ),
// )

// Pode ser utilizado em Child1() e Child2()
// BrazBlocProvider.of(context);