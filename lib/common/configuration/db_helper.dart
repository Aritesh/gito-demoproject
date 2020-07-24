import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'login_data.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableEmployee = 'employeeTable';
  final String columnId = 'id';
  final String columnFirstName = 'firstName';
  final String columnLastName = 'lastName';
  final String columnEmail = 'email';
  final String columnMobileNo = 'mobileNo';
  final String columnAddress = 'address';
  final String columnImageU = 'imageU';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'employees.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableEmployee($columnId INTEGER PRIMARY KEY, $columnFirstName TEXT, $columnLastName TEXT, $columnEmail TEXT ,$columnMobileNo TEXT ,$columnAddress TEXT ,$columnImageU TEXT)');
  }

  Future<int> saveEmployee(Employee employee) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableEmployee, employee.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List> getAllEmployees() async {
    var dbClient = await db;
    var result = await dbClient.query(tableEmployee, columns: [
      columnId,
      columnFirstName,
      columnLastName,
      columnEmail,
      columnMobileNo,
      columnAddress,
      columnImageU
    ]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableEmployee'));
  }

  Future<Employee> getEmployee(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableEmployee,
        columns: [
          columnId,
          columnFirstName,
          columnLastName,
          columnEmail,
          columnMobileNo,
          columnAddress,
          columnImageU
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Employee.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteEmployee(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableEmployee, where: '$columnId = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateEmployee(Employee employee) async {
    var dbClient = await db;
    return await dbClient.update(tableEmployee, employee.toMap(),
        where: "$columnId = ?", whereArgs: [employee.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
