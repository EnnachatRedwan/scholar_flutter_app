import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static const String routeName = '/loadin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
          child: SpinKitSquareCircle(
        color: Theme.of(context).primaryColor,
        size: 50.0,
      )),
    );
  }
}
