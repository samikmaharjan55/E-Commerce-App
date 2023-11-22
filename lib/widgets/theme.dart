import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor:Colors.white,
    textTheme: textTheme(),
  );
}

TextTheme textTheme(){
  return  const TextTheme(
    headlineLarge:TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
    headlineMedium:TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),  headlineSmall:TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),  titleLarge:TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),  titleMedium:TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),  titleSmall:TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  bodyLarge:TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium:TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ),
  );
}