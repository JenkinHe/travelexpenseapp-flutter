import 'package:flutter/material.dart';
import 'package:travelexpenses/widgets/expenses.dart';

var myLightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 60, 60));

var myDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 107, 0, 0));
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        colorScheme: myLightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myLightColorScheme.onPrimaryContainer,
          foregroundColor: myLightColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: myLightColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myLightColorScheme.secondaryContainer)),
                textTheme: const TextTheme().copyWith(
                  titleLarge:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: myLightColorScheme.primaryContainer
                  )
                )
                ),
    home: const Expenses(),
  ));
}
