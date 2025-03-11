import 'package:flutter/material.dart';

ThemeData themeLigh() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: const Color.fromARGB(137, 30, 30, 30),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(color: Colors.black, fontSize: 15),
      titleSmall: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 71, 71, 71),
      ),
      displaySmall: TextStyle(color: Colors.black, fontSize: 12),
    ),
  );
}

ThemeData themeDark() {
  return ThemeData.dark().copyWith(
    textTheme: TextTheme(
      displaySmall: TextStyle(color: Colors.black, fontSize: 12),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white54,
      ),
      labelMedium: TextStyle(
        color: Colors.white60,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
