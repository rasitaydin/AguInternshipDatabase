import 'package:internshipdatabase/locator.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/services/db_base.dart';
import 'package:internshipdatabase/services/local_db_service.dart';

class MainRepository implements DBService{
  LocalDBService _localDBService = locator<LocalDBService>();

  @override
  Future<bool> saveUser(User user) async{
    return await _localDBService.saveUser(user);
  }

  @override
  Future<bool> login(User user) async{
    return await _localDBService.login(user);
  }

  @override
  Future<bool> saveInternship(Internship internship) async{
    return await _localDBService.saveInternship(internship);
  }

  @override
  Future<Student> getStudent(String mail) async{
    return await _localDBService.getStudent(mail);
  }

  @override
  Future<bool> updateStudent(Student student) async{
    await _localDBService.updateStudent(student);
    return null;
  }

  @override
  Future<bool> getInternship({String country, String city, String gender, String department, int minGPA, String yearOfStudy, String freeLunch, String paid, String fullTime, String mandatory}) async{
    await _localDBService.getInternship(country: country, city: city, gender: gender, department: department, minGPA: minGPA, yearOfStudy: yearOfStudy, freeLunch: freeLunch, paid: paid, fullTime: fullTime, mandatory: mandatory);
    return null;
  }

}