class StudentInterests{
  String interestID;
  String studentID;

  StudentInterests({this.interestID, this.studentID});

  Map<String, dynamic> toMap() {
    return {
      'interest_id' : interestID,
      'student_id' : studentID,
    };
  }

  StudentInterests.fromMap(Map<String, dynamic> map):
        interestID = map['interest_id'],
        studentID = map['student_id'];

  @override
  String toString() {
    return 'City{id: $interestID, name: $studentID}';
  }

}