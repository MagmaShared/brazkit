//TODO implementar com opção de redraw

// import 'package:flutter/material.dart';
// import 'package:counterbloc_app/blocs/counter_bloc.dart';

// class CounterProvider extends StatefulWidget {
//   final Widget child;
//   CounterProvider({this.child});

//   static CounterBloc of(BuildContext context, {bool redraw = true}) =>
//       _CounterProviderInherited.of(context, redraw: redraw);

//   @override
//   _CounterProviderState createState() => _CounterProviderState();
// }

// class _CounterProviderState extends State<CounterProvider> {
//   final _bloc = CounterBloc();

//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _CounterProviderInherited(bloc: _bloc, child: widget.child);
//   }
// }

// class _CounterProviderInherited extends InheritedWidget {
//   final CounterBloc bloc;
//   final Widget child;
//   _CounterProviderInherited({this.bloc, this.child}) : super(child: child);

//   static CounterBloc of(BuildContext context, {bool redraw = true}) => redraw
//       ? (context.inheritFromWidgetOfExactType(_CounterProviderInherited)
//               as _CounterProviderInherited)
//           .bloc
//       : (context
//               .ancestorInheritedElementForWidgetOfExactType(
//                   _CounterProviderInherited)
//               .widget as _CounterProviderInherited)
//           .bloc;

//   @override
//   bool updateShouldNotify(_CounterProviderInherited oldWidget) {
//     return oldWidget.bloc != bloc;
//   }
// }