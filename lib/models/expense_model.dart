import 'dart:core';

class ExpenseModel {
  final double amount;
  final String? description;
  final DateTime date;

  const ExpenseModel({
    required this.amount,
    this.description = "-",
    required this.date,
  });
}

// sample expenses
final expenses = [
  ExpenseModel(
    amount: 20,
    description: null,
    date: DateTime(2022, 12, 31),
  ),
  ExpenseModel(
    amount: 30,
    description: "Party Ticket",
    date: DateTime(2022, 12, 31),
  ),
  ExpenseModel(
    amount: 16,
    description: "Daily Food",
    date: DateTime(2022, 12, 31),
  ),
];
