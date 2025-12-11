import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
 
  TextEditingController titleController = TextEditingController();
 
 @override
 void dispose() {
    titleController.dispose();
    super.dispose();
   
  }

  void onCreate() {
     
    //  1 Build an expense
    String  title = titleController.text;
    double amount = 0;             // for now..
    Category category =Category.food;   // for now..
    DateTime date = DateTime.now();

    Expense newExpense = Expense(title: title, amount: amount, date: date, category: category);
    Navigator.pop(context);
  }

  void onCancel() {
   
    // Close the modal
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
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
           Text("Value is ${titleController.text}"),
          ElevatedButton(onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert  Dialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(onPressed: () => Navigator.pop(context, 'OK'), child: const Text('OK')),
          ],
        ),
      ),
          child: Text("Create")),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: onCreate, child: Text("Cancel")),
        ],
      ),
    );
  }
}
