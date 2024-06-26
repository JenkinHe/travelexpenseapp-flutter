import 'package:flutter/material.dart';
import 'package:travelexpenses/widgets/expenses.dart';

var myLightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 60, 60));

var myDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 107, 0, 0));
void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: myDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
            color: myDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
             textTheme: const TextTheme().copyWith(
            titleLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: myDarkColorScheme.primaryContainer),
            headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: myDarkColorScheme.onPrimaryContainer,
            ))
    ),
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
            titleLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: myLightColorScheme.primaryContainer),
            headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: myLightColorScheme.onPrimaryContainer,
            ))),
    home: const Expenses(),
  ));
}
