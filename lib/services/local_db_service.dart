import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:internshipdatabase/models/student_model.dart';
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
    await db.execute("CREATE TABLE city "
        "(id INT NOT NULL AUTO_INCREMENT,"
        "name VARCHAR(45) NOT NULL, "
        "country_id INT NOT NULL, "
        "INDEX fk_city_country1_idx (country_id ASC) VISIBLE, "
        "CONSTRAINT fk_city_country1 "
        "FOREIGN KEY (country_id);");

  }

  @override
  Future<bool> saveStudent(Student student) async {
    var dbClient = await db;
    return null;
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
