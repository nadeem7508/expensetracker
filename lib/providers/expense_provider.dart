import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => [..._expenses];

  void addExpense(String title, double amount, DateTime date) {
    final newExpense = Expense(
      id: const Uuid().v4(),
      title: title,
      amount: amount,
      date: date,
    );
    _expenses.add(newExpense);
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  double get total {
    return _expenses.fold(0, (sum, e) => sum + e.amount);
  }
}
