class Student {
  String studentID;
  String name;
  String surname;
  String gender;
  String department;
  String phoneNumber;
  String email;
  String showMyPhone;

  Student({this.studentID, this.name, this.surname, this.gender, this.department,
      this.phoneNumber, this.email, this.showMyPhone});

  Map<String, dynamic> toMap() {
    return {
      'student_id' : studentID,
      'name' : name,
      'surname' : surname,
      'gender' : gender,
      'department' : department,
      'phone_number' : phoneNumber,
      'email' : email,
      'show_my_phone' : showMyPhone,
    };
  }

  Student.fromMap(Map<String, dynamic> map):
        studentID = map['student_id'],
        name = map['studentID'],
        surname = map['surname'],
        gender = map['gender'],
        department = map['department'],
        phoneNumber = map['phone_number'],
        showMyPhone = map['show_my_phone'];

  @override
  String toString() {
    return 'Student{studentID: $studentID, name: $name, surname: $surname, gender: $gender, department: $department, phoneNumber: $phoneNumber, email: $email, showMyPhone: $showMyPhone}';
  }

}