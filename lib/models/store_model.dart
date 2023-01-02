// Importing: Flutter Dependencies
import 'package:get/get.dart';

// Importing: Project Models
import 'package:expense_tracker/models/expense_model.dart';

// We make it observable so that we can use Get to listen to changes
final storeModel = StoreModel().obs;

class StoreModel {
  List<ExpenseModel> expenses = [];

  double get totalExpenseToday {
    final currentDate = DateTime.now();
    final firstDayOfMonth = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );

    return expenses.where((expenseModel) {
      return expenseModel.createdOn.isAfter(firstDayOfMonth);
    }).fold(0.0, (acc, expenseModel) {
      return acc + expenseModel.amount;
    });
  }

  double get totalExpenseWeek {
    final currentDate = DateTime.now();
    final firstDayOfWeek = currentDate.subtract(Duration(
      days: currentDate.weekday,
    ));

    return expenses.where((expenseModel) {
      return expenseModel.createdOn.isAfter(firstDayOfWeek);
    }).fold(0.0, (acc, expenseModel) {
      return acc + expenseModel.amount;
    });
  }

  double get totalExpenseMonth {
    final currentDate = DateTime.now();
    final firstDayOfMonth = DateTime(
      currentDate.year,
      currentDate.month,
      0,
    );

    return expenses.where((expenseModel) {
      return expenseModel.createdOn.isAfter(firstDayOfMonth);
    }).fold(0.0, (acc, expenseModel) {
      return acc + expenseModel.amount;
    });
  }

  double get totalExpenseYear {
    final currentDate = DateTime.now();
    final firstDayOfYear = DateTime(
      currentDate.year,
      0,
      0,
    );

    return expenses.where((expenseModel) {
      return expenseModel.createdOn.isAfter(firstDayOfYear);
    }).fold(0.0, (acc, expenseModel) {
      return acc + expenseModel.amount;
    });
  }

  void createExpense({
    required double amount,
    required String? description,
  }) {
    final expense = ExpenseModel(
      amount: amount,
      description: description,
      createdOn: DateTime.now(),
    );

    expenses.insert(0, expense);
    storeModel.refresh();
  }

  void editExpense(
    ExpenseModel expenseModel, {
    required double amount,
    required String? description,
  }) {
    expenseModel.amount = amount;
    expenseModel.description = description;
    storeModel.refresh();
  }

  void deleteExpense(ExpenseModel expenseModel) {
    expenses.remove(expenseModel);
    storeModel.refresh();
  }
}
