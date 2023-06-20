// import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/servises/theme_service.dart';
import 'core/theme.dart';
import 'features/weather/presentation/pages/home_page/cubit/get_temp_cubit.dart';
import 'features/weather/presentation/pages/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetTempCubit>(
          create: (BuildContext context) => GetTempCubit(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  // runApp(MyApp());
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
      home: const HomePage(),
    );
  }
}
