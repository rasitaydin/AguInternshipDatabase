import 'package:internshipdatabase/locator.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/services/db_base.dart';
import 'package:internshipdatabase/services/local_db_service.dart';

class MainRepository implements DBService{
  LocalDBService _localDBService = locator<LocalDBService>();

  @override
  Future<bool> saveStudent(Student student) {
    _localDBService.saveStudent(student);
    // TODO: implement saveStudent
    return null;
  }

}