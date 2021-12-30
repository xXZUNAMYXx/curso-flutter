import 'package:flutter/material.dart';

class AppTheme{
  //primaryColor
  static const Color primaryColorApp =  Colors.green; 

  final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColorApp,

    appBarTheme: const AppBarTheme(
      color: primaryColorApp,
      elevation: 0,
    )

  );
}