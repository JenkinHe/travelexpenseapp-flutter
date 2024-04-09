import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.porportion});

  final double porportion;

  @override
  Widget build(context) {
    // TODO: implement build
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FractionallySizedBox(
        heightFactor: porportion,
        child: DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: isDarkMode?Theme.of(context).colorScheme.onSecondaryContainer: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(7)))),
      ),
    ));
  }
}
