import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:internshipdatabase/models/city_model.dart';
import 'package:internshipdatabase/models/company_model.dart';
import 'package:internshipdatabase/models/contact_type_model.dart';
import 'package:internshipdatabase/models/country_model.dart';
import 'package:internshipdatabase/models/department_model.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/test_data.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/services/db_base.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBService implements DBService {
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

    await db.rawQuery(TestData.country);
    await db.rawQuery(TestData.city);
    await db.rawQuery(TestData.company);
    await db.rawQuery(TestData.contact);
    await db.rawQuery(TestData.departments);
    await db.rawQuery(TestData.studentInterests);
    await db.rawQuery(TestData.interests);
    await db.rawQuery(TestData.student);
    await db.rawQuery(TestData.internship);
  }

  @override
  Future<bool> saveUser(User user) async {
    var dbClient = await db;
    int number = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM user WHERE mail = "${user.mail}"'));
    if (number > 0) {
      return false;
    } else {
      number = Sqflite.firstIntValue(await dbClient.rawQuery(
          'SELECT COUNT(*) FROM user WHERE student_id = "${user.studentID}"'));
      if (number > 0) {
        return false;
      } else {
        await dbClient.insert("user", user.toMap());
        return true;
      }
    }
  }

  @override
  Future<bool> login(User user) async {
    var dbClient = await db;
    int number = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM user WHERE mail = "${user.mail}" AND pass = "${user.pass}"'));
    if (number > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> saveInternship(Internship internship) async {
    var dbClient = await db;
    Internship add = Internship();

    int countryNumber = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM country WHERE name = "${internship.country}"'));
    if(countryNumber == 0)
      await dbClient.rawInsert('INSERT INTO country (name) VALUES ("${internship.country}");');

    int cityNumber = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM city WHERE name = "${internship.city}"'));
    if(cityNumber == 0)
      await dbClient.rawInsert('INSERT INTO city (name) VALUES ("${internship.city}");');

    int companyNumber = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM company WHERE name = "${internship.company}"'));
    if(companyNumber == 0)
      await dbClient.rawInsert('INSERT INTO company (name) VALUES ("${internship.company}");');

    int departmentNumber = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM departments WHERE name = "${internship.department}"'));
    if(departmentNumber == 0)
      await dbClient.rawInsert('INSERT INTO departments (name) VALUES ("${internship.department}");');

    int contactTypeNumber = Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM contact_types WHERE name = "${internship.contactType}"'));
    if(contactTypeNumber == 0)
      await dbClient.rawInsert('INSERT INTO contact_types (name) VALUES ("${internship.contactType}");');


    var countryResult = await dbClient.query("country", where: "name = '${internship.country}'", limit: 1);
    Country myCountry = countryResult.map((data) => Country.fromMap(data)).toList()[0];
    add.country = myCountry.id;

    var cityResult = await dbClient.query("city", where: "name = '${internship.city}'", limit: 1);
    City myCity = cityResult.map((data) => City.fromMap(data)).toList()[0];
    add.city = myCity.id;

    var companyResult = await dbClient.query("company", where: "name = '${internship.company}'", limit: 1);
    Company myCompany = companyResult.map((data) => Company.fromMap(data)).toList()[0];
    add.company = myCompany.id;

    var departmentResult = await dbClient.query("departments", where: "name = '${internship.department}'", limit: 1);
    Department myDepartment = departmentResult.map((data) => Department.fromMap(data)).toList()[0];
    add.department = myDepartment.id;

    var contactTypeResult = await dbClient.query("contact_types", where: "name = '${internship.contactType}'", limit: 1);
    ContactType myContactType = contactTypeResult.map((data) => ContactType.fromMap(data)).toList()[0];
    add.contactType = myContactType.id;
    
    add.startDate = internship.startDate;
    add.endDate = internship.endDate;
    add.freeLunch = internship.freeLunch;
    add.yearOfStudent = internship.yearOfStudent;
    add.gpa = internship.gpa;
    add.isPaid = internship.isPaid;
    add.isFullTime = internship.isFullTime;
    add.isMandatory = internship.isMandatory;
    add.contactInfo = internship.contactInfo;
    add.student = internship.student;

    await dbClient.insert("internship", add.toMap());
  }

  @override
  Future<Student> getStudent(String email) async {
    var dbClient = await db;
    var result = await dbClient.query("student", where: 'email = "${email}"');
    List<Student> student =
        result.map((data) => Student.fromMap(data)).toList();
    debugPrint(
        ">>> local_db_service >>> getUser() >>> ${student[0].toString()}");
    return student[0];
  }

  Future<Student> getStudentViaID(String id) async {
    var dbClient = await db;
    var result = await dbClient.query("student", where: 'student_id = "${id}"');
    List<Student> student =
    result.map((data) => Student.fromMap(data)).toList();
    debugPrint(
        ">>> local_db_service >>> getUser() >>> ${student[0].toString()}");
    return student[0];
  }

  @override
  Future<bool> updateStudent(Student student) async {
    var dbClient = await db;
    final String update = "UPDATE student SET "
        "name = '${student.name}',"
        "surname = '${student.surname}',"
        "gender = '${student.gender}',"
        "department = '${student.department}',"
        "phone_number = '${student.phoneNumber}',"
        "show_my_phone = '${student.showMyPhone}'"
        "WHERE student_id = '${student.studentID}';";

    await dbClient.rawUpdate(update);
    return true;
  }

  @override
  Future<List<Internship>> getInternship(Internship internship) async{
    var dbClient = await db;
    final String getInternship =
        "SELECT internship.id AS id, student.gender AS gender, start_date, end_date, company.name AS company_id, contact_info, free_launch, "
        "year_of_student, gpa, is_paid, is_full_time, is_mandatory, city.name AS city_id, country.name AS country_id, "
        "departments.name AS departments_id, contact_types.name AS contact_types_id, internship.student_id AS student_id "
        "FROM internship, city, country, departments, contact_types, company, student "
        "WHERE internship.city_id = city.id AND student.student_id = internship.student_id AND country.id = city.country_id "
        "AND internship.departments_id = departments.id AND internship.contact_types_id = contact_types.id "
        "AND internship.company_id = company.id AND "
        "country.name LIKE '%${internship.country ?? ""}%' AND "
        "city.name LIKE '%${internship.city ?? ""}%' AND "
        "departments.name LIKE '%${internship.department ?? ""}%' AND "
        "gpa > ${internship.gpa ?? "0"} AND "
        "year_of_student LIKE '%${internship.yearOfStudent ?? ""}%' AND "
        "is_paid LIKE '%${internship.isPaid ?? ""}%' AND "
        "is_full_time LIKE '%${internship.isFullTime ?? ""}%' AND "
        "is_mandatory LIKE '%${internship.isMandatory ?? ""}%' AND "
        "free_launch LIKE '%${internship.freeLunch ?? ""}%';";
    List<Map> data = await dbClient.rawQuery(getInternship);
    List<Internship> result = List<Internship>();
    print(data);
    for(Map records in data){
      Internship x = Internship.fromMap(records);
      x.studentData = await getStudentViaID(x.student);
      result.add(x);
    }

    return result;
  }
}
