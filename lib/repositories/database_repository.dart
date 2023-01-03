import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import 'package:expense_tracker/models/expense_model.dart';

class DatabaseRepository {
  final Database database;

  DatabaseRepository(this.database);

  static Future<DatabaseRepository> newConnection() async {
    final databasesPath = await getDatabasesPath();
    final databasePath = path.join(databasesPath, "expense_tracker.db");

    final database = await openDatabase(databasePath, version: 1,
        onCreate: (Database db, int version) async {
      db.execute("""
        CREATE TABLE expenses(
          uuid TEXT PRIMARY KEY,
          amount REAL NOT NULL,
          description TEXT,
          created_on INTEGER NOT NULL
          );
      """);
    });

    return DatabaseRepository(database);
  }

  // Fetches all the expenses from the database
  Future<List<ExpenseModel>> all() async {
    final rows = await database.query("expenses");

    return rows.map((result) {
      return ExpenseModel.fromMap(result);
    }).toList();
  }

  // Stores a new expense record in the database
  void createExpense(ExpenseModel expense) {
    database.insert("expenses", expense.toMap());
  }

  // Updates an existing expense record in the database
  Future<int> updateExpense(ExpenseModel expense) async {
    return await database.update(
      "expenses",
      expense.toMap(),
      where: "uuid = ?",
      whereArgs: [expense.uuid],
    );
  }
}
