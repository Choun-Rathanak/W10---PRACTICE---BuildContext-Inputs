import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();  

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();  
    super.dispose();
  }

  void onCreate() {
    String title = titleController.text;
    double amount = double.tryParse(amountController.text) ?? 0;  
    Category category = Category.food;
    DateTime date = DateTime.now();

    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );
    
    Navigator.pop(context, newExpense);  
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(  
            controller: amountController,
            decoration: InputDecoration(label: Text("Amount")),
            maxLength: 50,
            keyboardType: TextInputType.number,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onCancel,  
                child: Text("Cancel"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onCreate,
                child: Text("Create"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}