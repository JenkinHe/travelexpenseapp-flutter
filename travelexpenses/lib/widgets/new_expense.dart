import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelexpenses/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    // TODO: implement createState
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _chosenDate;
  Category _chosenCategory=Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);

    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _chosenDate = selectedDate;
    });
  }

  void _submitExpense(){
    final enteredAmount=double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount==null||enteredAmount<=0;
    if(_titleController.text.trim().isEmpty||amountIsInvalid||_chosenDate==null){
      showDialog(context: context, builder: (dialogContext)=>
      AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please ensure you have entered a Title,amount,date and category'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(dialogContext);
          }, child: const Text('Okay'))
        ],
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 45,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_chosenDate == null
                      ? 'Select Date'
                      : formatter.format(_chosenDate!)),
                  IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
           Row(
            children: [
              const Text("Expense Category"),
              const SizedBox(
                width: 30,
              ),
              DropdownButton(
                  value: _chosenCategory,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()))).toList(),
                  onChanged: (value) {
                    if(value==null) return;
                    setState(() {
                      _chosenCategory=value;
                    });
                  })
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _submitExpense();
                  },
                  child: const Text("Save Expense")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
