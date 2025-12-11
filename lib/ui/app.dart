import 'package:flutter/material.dart';

import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';

class App extends StatelessWidget {
  const App({super.key});

  void onAddClicked(BuildContext context) {
  
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(
        child: ExpenseForm(  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ExpensesView(),
    );
  }
}
