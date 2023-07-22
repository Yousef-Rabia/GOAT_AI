import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
      bodySmall: TextStyle(
          color: Colors.red, fontSize: 14),


  ),


  primarySwatch: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Janna',
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
  ),
  fontFamily: 'Janna',
);
ThemeData darkTheme = ThemeData(
  primarySwatch: primaryColor,
  scaffoldBackgroundColor: darkBG,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkBG,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: darkBG,
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    backgroundColor: darkBG,
    unselectedItemColor: Colors.grey,

  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
    bodySmall: TextStyle(
      color: Colors.white, fontSize: 16),
  ),

  fontFamily: 'Janna',
);