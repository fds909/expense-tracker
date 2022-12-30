import 'package:flutter/material.dart';
import 'package:expense_tracker/pages/home/components/header.dart';
import 'package:expense_tracker/pages/home/components/content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/';

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
        onPressed: () {},
        label: Text("New Expense"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.green.shade700,
      ),
    );
  }
}
