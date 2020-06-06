import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/services/db_base.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBService implements DBService{
  static Database _db;
  String _path;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    _path = databasesPath + '\\local.db';
    debugPrint("db created >>> " + _path);
    return await openDatabase(_path, onCreate: _onCreate, version: 1);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE user"
        "(mail TEXT,"
        "pass TEXT,"
        "student_id TEXT);");

    await db.execute("CREATE TABLE city"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "country_id INTEGER,"
        "FOREIGN KEY(country_id) REFERENCES country(id));");

    await db.execute("CREATE TABLE company"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT);");

    await db.execute("CREATE TABLE contact_types"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT);");

    await db.execute("CREATE TABLE country"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT);");

    await db.execute("CREATE TABLE departments"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT);");

    await db.execute("CREATE TABLE interest_areas"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT);");

    await db.execute("CREATE TABLE student_interests"
        "(interest_areas_id INTEGER,"
        "student_student_id INTEGER,"
        "FOREIGN KEY(interest_areas_id) REFERENCES interest_areas(id),"
        "FOREIGN KEY(student_student_id) REFERENCES student(student_id));");

    await db.execute("CREATE TABLE student"
        "(student_id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "surname TEXT,"
        "gender TEXT,"
        "department TEXT,"
        "phone_number TEXT,"
        "email TEXT,"
        "show_my_phone TEXT);");

    await db.execute("CREATE TABLE internship"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "start_date TEXT,"
        "end_date TEXT,"
        "contact_info TEXT,"
        "free_launch TEXT,"
        "year_of_student TEXT,"
        "gpa TEXT,"
        "is_paid TEXT,"
        "is_full_time TEXT,"
        "is_mandatory TEXT,"
        "city_id INTEGER,"
        "country_id INTEGER,"
        "departments_id INTEGER,"
        "contact_types_id INTEGER,"
        "company_id INTEGER,"
        "student_id INTEGER,"
        "FOREIGN KEY(city_id) REFERENCES city(id),"
        "FOREIGN KEY(country_id) REFERENCES country(id),"
        "FOREIGN KEY(departments_id) REFERENCES departments(id),"
        "FOREIGN KEY(contact_types_id) REFERENCES contact_types(id),"
        "FOREIGN KEY(company_id) REFERENCES company(id),"
        "FOREIGN KEY(student_id) REFERENCES student(student_id));");

  }

  @override
  Future<bool> saveUser(User user) async {
    var dbClient = await db;
    int number = Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM user WHERE mail = "${user.mail}"'));
    if(number > 0){
      return false;
    } else{
      number = Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM user WHERE student_id = "${user.studentID}"'));
      if(number > 0){
        return false;
      } else {
        await dbClient.insert("user", user.toMap());
        return true;
      }
    }
  }

  @override
  Future<bool> login(User user) async{
    var dbClient = await db;
    int number = Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM user WHERE mail = "${user.mail}"'));
    if(number > 0){
      return true;
    } else{
      return false;
    }
  }

  /*

  Future<List<Message>> queryMessages() async{
    var dbClient = await db;
    var result = await dbClient.query("MESSAGES", orderBy: "date");
    debugPrint(">>>>>>>>>> $result");
    return result.map((data) => Message.fromMap(data)).toList();
  }

  @override
  Stream<List<Message>>  getMessages(String fromID, String toID) {
    return Stream.fromFuture(queryMessages());
  }


  @override
  Future<bool> signOut() async {
    deleteDatabase(_path);
    return true;
  }

  @override
  Future<bool> saveUser(User user) async {
    var dbClient = await db;
    await dbClient.insert("USER", user.toMap());
  }

  @override
  Future<User> getUser(String userID) async {
    var dbClient = await db;
    var result = await dbClient.query("USER");
    List<User> user = result.map((data) => User.fromMap(data)).toList();
    debugPrint(">>> local_db_service >>> getUser() >>> ${user[0].toString()}");
    return user[0];
  }

   */


}
