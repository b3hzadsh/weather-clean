import 'package:flutter/material.dart';

import '../features/setting/presentation/pages/setting_page.dart';
import '../features/weather/presentation/pages/home_page/home_page.dart';

class RouteStuff {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePageWrapperProvider(),
        );
      case '/screens/setting':
        return MaterialPageRoute(
          builder: (context) => const SettingPageWrapperProvider(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePageWrapperProvider(),
        );
    }
  }
}
