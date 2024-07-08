import 'package:education_app_two/src/themes/color/color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData.light().copyWith(
    // primarySwatch: Colors.blue,
    scaffoldBackgroundColor: LightColor.background,

    primaryColor: LightColor.Purple,

    primaryColorDark: LightColor.darkerColor,

    primaryColorLight: LightColor.brighter,

    cardTheme: const CardTheme(color: LightColor.background),

    // textTheme: TextTheme(display1: TextStyle(color: LightColor.black)),
    iconTheme: const IconThemeData(color: LightColor.lightBlack),

    dividerColor: LightColor.lightGrey,

    colorScheme: const ColorScheme(
            primary: LightColor.Purple,
            onPrimaryFixedVariant: LightColor.Purple,
            secondary: LightColor.LightBlue,
            surface: LightColor.background,
            error: Colors.red,
            onPrimary: LightColor.darkerColor,
            onSecondary: LightColor.background,
            onSurface: LightColor.darkerColor,
            onError: LightColor.titleTextColor,
            brightness: Brightness.dark)
        .copyWith(surface: LightColor.background),
    bottomAppBarTheme: const BottomAppBarTheme(color: LightColor.background),
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
