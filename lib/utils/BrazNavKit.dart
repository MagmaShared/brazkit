import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BrazNavKit {

  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static final BrazNavKit _instance = BrazNavKit._internal();
  factory BrazNavKit() { 
    return _instance; 
  }
  BrazNavKit._internal();

  static dynamic push(BuildContext context, Widget page) async {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      return await Navigator.push(context, MaterialPageRoute(builder : (context) => page ));
    });
  }

  static dynamic pushReplacement(BuildContext context, Widget page) async {
    return await Navigator.pushReplacement(context, MaterialPageRoute(builder : (context) => page ));
  }

  static void pop(BuildContext context){
    Navigator.pop(context);
  }

  Future<dynamic> route(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> routeWithParams(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
  }

  bool backRoute() {
    return navigatorKey.currentState.pop();
  }
}

// Use:
// in main.dart
//return MaterialApp(      
// navigatorKey: BrazNavKit().navigatorKey,
// onGenerateRoute: router.generateRoute,
// initialRoute: routes.LoginRoute,

//router
// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case routes.LoginRoute:
//       return MaterialPageRoute(builder: (context) => LoginView());
//     case routes.HomeRoute:
//       var userName = settings.arguments as String;
//       return MaterialPageRoute(
//           builder: (context) => HomeView(userName: userName));
//     default:
//       return MaterialPageRoute(
//         builder: (context) => Scaffold(
//           body: Center(
//             child: Text('No path for ${settings.name}'),
//           ),
//         ),
//       );
//   }
// }