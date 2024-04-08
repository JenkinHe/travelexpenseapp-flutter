import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelexpenses/expense_list_widget.dart';
import 'package:travelexpenses/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses();

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _myExpenses = [
    Expense(
        title: 'dinner',
        amount: 20,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'sky diving',
        amount: 40,
        date: DateTime.now(),
        category: Category.experience)
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Text("Travel Expenses"),
          const Text("Travel chart"),
          Expanded(child: ExpensesList(allExpenses: _myExpenses)),
        ],
      ),
    );
  }
}
