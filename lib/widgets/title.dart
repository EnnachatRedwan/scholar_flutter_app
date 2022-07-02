import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    required this.padding,
  }) : super(key: key);

  final String title;
  final double padding;

  @override
  Widget build(BuildContext context) {
    var bounds = MediaQuery.of(context).size;
    var theme=Provider.of<AppTheme>(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: bounds.height * padding),
      child: Text(
        title,
        style: TextStyle(
          color: theme.textColor,
          fontSize: theme.bigTitleSize,
        ),
      ),
    );
  }
}
