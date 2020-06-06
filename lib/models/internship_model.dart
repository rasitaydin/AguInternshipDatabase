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
  String contactInfo;
  String city;
  String country;
  String department;
  String contactType;
  String company;
  String student;

  Internship({this.id, this.startDate, this.endDate, this.contactInfo,
      this.freeLunch, this.yearOfStudent, this.gpa, this.isPaid,
      this.isFullTime, this.isMandatory, this.city, this.country,
      this.department, this.contactType, this.company, this.student});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'start_date' : startDate,
      'end_date' : endDate,
      'contact_info' : contactInfo,
      'free_lunch' : freeLunch,
      'year_of_student' : yearOfStudent,
      'gpa' : gpa,
      'is_paid' : isPaid,
      'is_full_time' : isFullTime,
      'is_mandatory' : isMandatory,
      'city_id' : city,
      'country_id' : country,
      'departments_id' : department,
      'contact_types_id' :  contactType,
      'company_id' : company,
      'student_id' : student

    };
  }

  Internship.fromMap(Map<String, dynamic> map):
        id = map['id'],
        startDate = map['start_date'],
        endDate = map['end_date'],
        contactInfo = map['contact_info'],
        freeLunch = map['free_lunch'],
        yearOfStudent = map['year_of_student'],
        gpa = map['gpa'],
        isPaid = map['is_paid'],
        isFullTime = map['is_full_time'],
        isMandatory = map['is_mandatory'],
        city = map['city_id'],
        country = map['country_id'],
        department = map['departments_id'],
        contactType = map['contact_types_id'],
        company = map['company_id'],
        student = map['student_id'];

  @override
  String toString() {
    return 'Internship{id: $id, startDate: $startDate, endDate: $endDate, freeLunch: $freeLunch, yearOfStudent: $yearOfStudent, gpa: $gpa, isPaid: $isPaid, isFullTime: $isFullTime, isMandatory: $isMandatory, contactInfo: $contactInfo, city: $city, country: $country, department: $department, contactType: $contactType, company: $company, student: $student}';
  }

}