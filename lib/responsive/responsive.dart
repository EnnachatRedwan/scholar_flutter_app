import 'package:flutter/cupertino.dart';

import './bounds.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  static const String routeName='/responsive';

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<=Bounds.mobileSize){
        return mobile;
      }
      else if(constraints.maxWidth>Bounds.mobileSize&&constraints.maxWidth<=Bounds.tabletSize){
        return tablet;
      }
      else{
        return desktop;
      }
    },);
  }
}
