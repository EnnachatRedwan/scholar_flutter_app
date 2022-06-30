import 'package:flutter/material.dart';

import '../layouts/mobile_layout.dart';
import '../layouts/tablet_layout.dart';
import '../layouts/desktop_layout.dart';
import '../responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: DesktopLayout(),
      mobile: MobileLayout(),
      tablet: TabletLayout(),
    );
  }
}
