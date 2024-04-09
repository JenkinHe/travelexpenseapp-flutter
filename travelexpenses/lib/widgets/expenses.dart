import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelexpenses/widgets/expense_list/expense_list_widget.dart';
import 'package:travelexpenses/models/expense.dart';
import 'package:travelexpenses/widgets/new_expense.dart';

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

  void _openAddExpenseItemOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (modalContext) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _myExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _myExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainScreenContent = const Center(
      child: Text('No Expenses please add some.'),
    );

    if (_myExpenses.isNotEmpty) {
      mainScreenContent = ExpensesList(
        allExpenses: _myExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseItemOverlay,
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("Travel Expenses"),
          const Text("Travel chart"),
          Expanded(child: mainScreenContent)
        ],
      ),
    );
  }
}
