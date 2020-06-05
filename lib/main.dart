import 'package:flutter/material.dart';
import 'package:internshipdatabase/pages/add_internship_page.dart';
import 'package:internshipdatabase/pages/internship_details_page.dart';
import 'package:internshipdatabase/pages/login_page.dart';
import 'package:internshipdatabase/pages/profile_page.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/pages/signup_page.dart';
import 'package:internshipdatabase/pages/welcome_page.dart';
import 'package:flutter/services.dart' ;

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return  MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
            accentColor: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/'               : (context) => InternshipDetailsPage(),

          },
        );
  }
}
