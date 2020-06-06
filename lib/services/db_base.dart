import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/models/user_model.dart';

abstract class DBService {
  Future<bool> saveUser(User user);
  Future<bool> saveInternship(Internship internship);
  Future<Student> getStudent(String studentID);
  Future<bool> login(User user);

}