import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Importing: Project Models
import 'package:expense_tracker/models/store_model.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/pages/edit_expense/edit_expense_page.dart';
import 'package:intl/intl.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) =>
              ExpenseTile(expense: storeModel.value.expenses[index]),
          itemCount: storeModel.value.expenses.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey.shade500,
            height: 0,
          ),
        ),
      ),
    );
  }
}

// Each Expense Tile provides amount, date and description for a single expense
class ExpenseTile extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseTile({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        EditExpensePage.route,
        arguments: expense,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      leading: AspectRatio(
        aspectRatio: 5 / 3,
        // Expense Box
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              "€ ${expense.amount.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      // Expense Creation Date
      title: Text(
        "${DateFormat("dd MMMM").format(expense.createdOn)}",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Container(
        margin: EdgeInsets.only(top: 5),
        child: Text(
          expense.description ?? '-',
          style: TextStyle(color: Colors.grey.shade500),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.chevron_right),
        iconSize: 28,
        onPressed: () {},
      ),
    );
  }
}
