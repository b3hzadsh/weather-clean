// import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gradle_files/injection_container.dart' as di;

import 'core/route.dart';
import 'core/theme.dart';
import 'core/servises/theme_service.dart';
import 'features/setting/presentation/pages/setting_page.dart';
import 'features/weather/presentation/pages/home_page/home_page.dart';

void main() async {
  /// remove commented codes
  ///
  WidgetsFlutterBinding.ensureInitialized();
  // final route = RouteStuff(); // todo inject and set
  await di.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    return MaterialApp(
      title: 'Weather App',
      themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings setting) {
        if (setting.name == "/") {
          return MaterialPageRoute(
            builder: (context) => const HomePageWrapperProvider(),
          );
        } else if (setting.name == "/screens/setting") {
          return MaterialPageRoute(
            builder: (context) => const SettingPageWrapperProvider(),
          );
        }
        return MaterialPageRoute(
          builder: (context) => const SettingPage(),
        );
      },
    );
  }
}
