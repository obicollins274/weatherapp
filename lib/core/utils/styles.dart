import 'package:flutter/material.dart';

final White = Color.fromRGBO(250, 250, 250, 1);
final Color DVTBlue = Color.fromRGBO(78, 146, 223, 1);
final Color Sunny = Color(0xff47Ab2f);
final Color Cloudy = Color(0xff54717a);
final Color Rainy = Color(0xff57575d);

ThemeData AppTheme() {
  return ThemeData(
    canvasColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: White),
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1:
          TextStyle(fontSize: 42, fontWeight: FontWeight.w600, color: White),
      headline2:
          TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: White),
      headline3:
          TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: White),
      headline4:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: White),
      bodyText1:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: White),
      bodyText2:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: White),
      subtitle1: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
    ),
  );
}
