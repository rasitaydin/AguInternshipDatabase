class User{
  String mail;
  String pass;
  String studentID;

  User({this.mail, this.pass, this.studentID});

  Map<String, dynamic> toMap() {
    return {
      'mail' : mail,
      'pass' : pass,
      'student_id' : studentID,
    };
  }

  User.fromMap(Map<String, dynamic> map):
        mail = map['mail'],
        pass = map['pass'],
        studentID = map['student_id'];

  @override
  String toString() {
    return 'User{mail: $mail, pass: $pass, studentID: $studentID}';
  }

}