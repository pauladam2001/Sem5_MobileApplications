import 'package:basketball_team_management_flutter/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("CREATE TABLE employees(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, age INTEGER, occupation TEXT, salary INTEGER, experience INTEGER);");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'employees.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      }
    );
  }

  static Future<List<Employee>?> getEmployees() async {
    final db = await DatabaseHelper.db();
    final List<Map<String, dynamic>> maps = await db.query("employees");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Employee.fromMap(maps[index]));
  }

  static Future<int> addEmployee(String? name, int? age, String? occupation, int? salary, int? experience) async {
    final db = await DatabaseHelper.db();
    final data = {'name': name, 'age': age, 'occupation': occupation, 'salary': salary, 'experience': experience};
    final id = await db.insert('employees', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> updateEmployee(int id, String name, int age, String occupation, int salary, int experience) async {
    final db = await DatabaseHelper.db();
    final data = {'name': name, 'age': age, 'occupation': occupation, 'salary': salary, 'experience': experience};
    final result = await db.update('employees', data, where: "id = ?", whereArgs: [id]);

    return result;
  }

  static Future<void> deleteEmployee(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete('employees', where: "id = ?", whereArgs: [id]);
    } catch (error) {
      debugPrint("Error on delete: $error");
    }
  }
}