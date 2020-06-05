class User{
  String mail;
  String pass;

  User({this.mail, this.pass});

  Map<String, dynamic> toMap() {
    return {
      'mail' : mail,
      'pass' : pass,
    };
  }

  User.fromMap(Map<String, dynamic> map):
        mail = map['mail'],
        pass = map['pass'];

  @override
  String toString() {
    return 'City{mail: $mail, pass: $pass}';
  }

}