import 'package:expense_tracker/models/store_model.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/components/expense_edit.dart';
import 'package:expense_tracker/models/expense_model.dart';

class EditExpensePage extends StatefulWidget {
  static const route = '/expense/edit';
  final ExpenseModel expenseModel;

  const EditExpensePage({required this.expenseModel});

  @override
  State<EditExpensePage> createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  void onSubmit({
    required double value,
    required String? description,
  }) {
    storeModel.value.editExpense(
      widget.expenseModel,
      amount: value,
      description: description,
    );

    Navigator.pop(context);
  }

  void onDelete() {
    storeModel.value.deleteExpense(widget.expenseModel);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ExpenseEdit(
      floatingActionButtonIcon: Icons.delete,
      onFloatingActionButtonPressed: onDelete,
      initialDescription: widget.expenseModel.description,
      initialValue: widget.expenseModel.amount,
      onSubmit: onSubmit,
    );
  }
}
