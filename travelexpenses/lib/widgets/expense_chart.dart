import 'package:flutter/material.dart';
import 'package:travelexpenses/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<AllExpensesContainer> get individualExpenses {
    return [
      AllExpensesContainer.forCategory(expenses, Category.food),
      AllExpensesContainer.forCategory(expenses, Category.experience),
      AllExpensesContainer.forCategory(expenses, Category.shopping),
      AllExpensesContainer.forCategory(expenses, Category.stay),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final categoryExpense in individualExpenses)
                Text(categoryExpense.sumOfExpenses.toString())
            ],
          ))
        ],
      ),
    );
  }
}
