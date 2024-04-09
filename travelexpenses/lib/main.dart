import 'package:flutter/material.dart';
import 'package:travelexpenses/widgets/expenses.dart';

var myLightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 60, 60));

var myDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 107, 0, 0));
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(colorScheme: myLightColorScheme),
    home: const Expenses(),
  ));
}
