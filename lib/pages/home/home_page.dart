// Importing: Flutter Dependencies
import 'package:flutter/material.dart';

import 'package:expense_tracker/pages/home/components/header.dart';
import 'package:expense_tracker/pages/home/components/content.dart';
import 'package:expense_tracker/pages/new_expense/new_expense_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Content(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, NewExpensePage.route);
        },
        label: Text("New Expense"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.green.shade600,
      ),
    );
  }
}
