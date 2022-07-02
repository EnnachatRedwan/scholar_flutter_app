import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  Color backgroundColor = const Color.fromRGBO(255, 255, 255, 1);
  Color homeBackgroundColor = const Color.fromARGB(255, 226, 226, 226);
  Color textColor = const Color.fromARGB(255, 0, 0, 0);
  Color subTextColor = const Color.fromRGBO(92, 92, 92, 1);
  Color drawerTextColor = const Color.fromRGBO(66, 66, 66, 1);
  double bigTitleSize = 40;
  double titleSize = 23;
  double smalTitleSize = 19;
  double textSize = 17;
  double subTitleSize = 15;
  double smalSubTitleSize = 13;
  double buttonTextSize = 20;

  void _light() {
    backgroundColor = const Color.fromRGBO(255, 255, 255, 1);
    homeBackgroundColor = const Color.fromARGB(255, 226, 226, 226);
    textColor = const Color.fromARGB(255, 0, 0, 0);
    subTextColor = const Color.fromRGBO(92, 92, 92, 1);
    drawerTextColor = const Color.fromRGBO(66, 66, 66, 1);
    bigTitleSize = 40;
    titleSize = 23;
    smalTitleSize = 19;
    textSize = 17;
    subTitleSize = 15;
    smalSubTitleSize = 13;
    buttonTextSize = 20;
    notifyListeners();
  }
}
