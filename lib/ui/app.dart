import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked(BuildContext context) async {
    final newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(
        child: ExpenseForm(),
      ),
    );

    if (newExpense != null) {
      setState(() {
        _expenses.add(newExpense);
      });
    }
  }

  void onExpenseRemoved(int index) {
    final removedExpense = _expenses[index]; 
    
    setState(() {
      _expenses.removeAt(index);
    });

    
    ScaffoldMessenger.of(context).clearSnackBars();

    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(index, removedExpense); 
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Start adding some!',
        style: TextStyle(fontSize: 16),
      ),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesView(
        expenses: _expenses,
        onExpenseRemoved: onExpenseRemoved,
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onAddClicked(context),
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: mainContent,
    );
  }
}