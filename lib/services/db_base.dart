import 'package:internshipdatabase/models/student_model.dart';

abstract class DBService {
  Future<bool> saveStudent(Student student);

}