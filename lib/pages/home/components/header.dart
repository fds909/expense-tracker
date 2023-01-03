// Importing: Flutter Dependencies
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Importing: Models
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/models/store_model.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 60),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // This Month Expenses Total
              Text(
                "This Month".toUpperCase(),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white60,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "€ ${storeModel.value.totalExpenseMonth.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: ExpensesBox(
                        label: "today",
                        value: storeModel.value.totalExpenseToday),
                  ),
                  Flexible(
                    flex: 1,
                    child: ExpensesBox(
                        label: "week",
                        value: storeModel.value.totalExpenseWeek),
                  ),
                  Flexible(
                    flex: 1,
                    child: ExpensesBox(
                        label: "year",
                        value: storeModel.value.totalExpenseYear),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpensesBox extends StatelessWidget {
  final String label;
  final double value;

  const ExpensesBox({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5),
          Text(
            "€ ${value.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 13,
              color: Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
