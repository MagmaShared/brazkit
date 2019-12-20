import 'package:flutter/widgets.dart';

abstract class BrazState<T extends StatefulWidget> extends State<T> {

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadContext(context));
  }

  /// this method registers a callback for the start of the next frame and
  /// is called exactly once (Does *not* request a new frame.)
  void onLoadContext(BuildContext context){}
  
}