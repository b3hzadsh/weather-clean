import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static final Color _lightPrimaryColor = Colors.grey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.grey.shade800;
  static final Color _lightOnPrimaryColor = Colors.grey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.grey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black87;
  static final Color _darkOnPrimaryColor = Colors.grey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.grey.shade800;

  static const Color _iconColor = Colors.yellow;

  static const Color _accentColor = Colors.yellow;

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Roboto",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _lightBodyLargeText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 140,
  );
  static const TextStyle _lightBodyMediumText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 60,
  );
  static const TextStyle _lightBodySmallText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 40,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyLargeText,
    bodyMedium: _lightBodyMediumText,
    bodySmall: _lightBodySmallText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkThemeBodyLargeTextStyle =
      _lightBodyLargeText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkThemeBodyMediumTextStyle =
      _lightBodyMediumText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkThemeBodySmallTextStyle =
      _lightBodySmallText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyLargeTextStyle,
    bodyMedium: _darkThemeBodyMediumTextStyle,
    bodySmall: _darkThemeBodySmallTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: _appbarColorLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
    bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark),
  );
}
