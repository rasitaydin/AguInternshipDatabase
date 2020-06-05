import 'package:internshipdatabase/models/city_model.dart';
import 'package:internshipdatabase/models/company_model.dart';
import 'package:internshipdatabase/models/contact_type_model.dart';
import 'package:internshipdatabase/models/country_model.dart';
import 'package:internshipdatabase/models/department_model.dart';
import 'package:internshipdatabase/models/student_model.dart';

class Internship{
  String id;
  String startDate;
  String endDate;
  String freeLunch;
  String yearOfStudent;
  String gpa;
  String isPaid;
  String isFullTime;
  String isMandatory;
  ContactType contactInfo;
  City city;
  Country country;
  Department department;
  ContactType contactType;
  Company company;
  Student student;

  Internship({this.id, this.startDate, this.endDate, this.contactInfo,
      this.freeLunch, this.yearOfStudent, this.gpa, this.isPaid,
      this.isFullTime, this.isMandatory, this.city, this.country,
      this.department, this.contactType, this.company, this.student});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
    };
  }

  Internship.fromMap(Map<String, dynamic> map):
        id = map['id'];

  @override
  String toString() {
    return 'Internship{id: $id, startDate: $startDate, endDate: $endDate, freeLunch: $freeLunch, yearOfStudent: $yearOfStudent, gpa: $gpa, isPaid: $isPaid, isFullTime: $isFullTime, isMandatory: $isMandatory, contactInfo: $contactInfo, city: $city, country: $country, department: $department, contactType: $contactType, company: $company, student: $student}';
  }

}