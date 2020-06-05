import 'package:internshipdatabase/models/department_model.dart';

class Student {
  String studentID;
  String name;
  String surname;
  String gender;
  Department department;
  String phoneNumber;
  String email;
  String showMyPhone;

  Student({this.studentID, this.name, this.surname, this.gender, this.department,
      this.phoneNumber, this.email, this.showMyPhone});

  Map<String, dynamic> toMap() {
    return {
      'studentID' : studentID,
    };
  }

  Student.fromMap(Map<String, dynamic> map):
        studentID = map['studentID'];

  @override
  String toString() {
    return 'Student{studentID: $studentID, name: $name, surname: $surname, gender: $gender, department: $department, phoneNumber: $phoneNumber, email: $email, showMyPhone: $showMyPhone}';
  }

}