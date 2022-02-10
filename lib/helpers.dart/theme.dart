import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    secondaryHeaderColor: Colors.blue,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    secondaryHeaderColor: Colors.red,
  );
}