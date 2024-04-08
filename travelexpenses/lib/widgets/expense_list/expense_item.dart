
import 'package:flutter/material.dart';
import 'package:travelexpenses/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build( context) {
    
    return  Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20
        ),
        child: 
        Column(children: [
            Text(expense.title),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(children: [
                  const Icon(Icons.fastfood),
                  const SizedBox(width: 5,),
                  Text(expense.date.toString())
                ],)
              ],
            )

        ],),
      ),
    );
  }
}