import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/models/user_model.dart';

abstract class DBService {
  Future<bool> saveUser(User user);

}