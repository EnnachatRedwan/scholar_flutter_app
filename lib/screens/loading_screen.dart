import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static const String routeName = '/loadin';

  @override
  Widget build(BuildContext context) {
    var theme=Provider.of<AppTheme>(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
          child: SpinKitSquareCircle(
        color: Theme.of(context).primaryColor,
        size: 50.0,
      )),
    );
  }
}
