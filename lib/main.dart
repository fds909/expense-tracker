// Importing: Flutter Dependencies
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

// Importing: Project Pages, Components, Models
import 'package:expense_tracker/pages/home/home_page.dart';
import 'package:expense_tracker/pages/new_expense/new_expense_page.dart';
import 'package:expense_tracker/pages/edit_expense/edit_expense_page.dart';

void main() async {
  Intl.defaultLocale = 'en_US';
  await initializeDateFormatting('en_US', null);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      onGenerateRoute: (settings) {
        final routes = {
          HomePage.route: (_) => HomePage(),
          NewExpensePage.route: (_) => NewExpensePage(),
          EditExpensePage.route: (_) =>
              EditExpensePage(expenseModel: settings.arguments as ExpenseModel),
        };

        return MaterialPageRoute(
          builder: routes[settings.name]!,
        );
      },
    );
  }
}
