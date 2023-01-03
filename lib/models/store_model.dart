// Importing: Flutter Dependencies
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

// Importing: Project Models, Repositories
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/repositories/database_repository.dart';
import 'package:uuid/uuid.dart';

// We make it observable so that we can use Get to listen to changes
final storeModel = StoreModel().obs;

class StoreModel {
  List<ExpenseModel> expenses = [];

  Future<void> initialize() async {
    final database = GetIt.I<DatabaseRepository>();
    expenses = await database.allExpenses();
  }

  //--- Stats Getters ---//

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
    required DateTime createdOn,
  }) {
    final expense = ExpenseModel(
      uuid: Uuid().v4(),
      amount: amount,
      description: description,
      createdOn: createdOn,
    );

    expenses.insert(0, expense);
    storeModel.refresh();

    GetIt.I<DatabaseRepository>().createExpense(expense);
  }

  void editExpense(
    ExpenseModel expense, {
    required double amount,
    required String? description,
    required DateTime createdOn,
  }) {
    expense.amount = amount;
    expense.description = description;
    expense.createdOn = createdOn;
    storeModel.refresh();

    GetIt.I<DatabaseRepository>().updateExpense(expense);
  }

  void deleteExpense(ExpenseModel expense) {
    expenses.remove(expense);
    storeModel.refresh();

    GetIt.I<DatabaseRepository>().deleteExpense(expense);
  }
}
