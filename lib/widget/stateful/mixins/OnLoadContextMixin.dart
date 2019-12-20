import 'package:flutter/widgets.dart';

mixin OnLoadContextMixin<T extends StatefulWidget> on State<T> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadContext(context));
  }

  void onLoadContext(BuildContext context);
}
