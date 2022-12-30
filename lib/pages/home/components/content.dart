import 'package:flutter/material.dart';

// Importing: Project Models
import 'package:expense_tracker/models/expense_model.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => ExpenseTile(expense: expenses[index]),
        itemCount: expenses.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade500,
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
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: EdgeInsets.all(16),
        width: 100,
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
      title: Text(
        "31 Dicembre",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "${expense.description}",
        style: TextStyle(color: Colors.grey.shade500),
      ),
      trailing: IconButton(
        icon: Icon(Icons.chevron_right),
        iconSize: 28,
        onPressed: () {},
      ),
    );
  }
}
