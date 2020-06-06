import 'package:flutter/material.dart';
import 'package:internshipdatabase/locator.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' ;
import 'pages/login_page.dart';
import 'pages/search_internship_page.dart';
import 'pages/signup_page.dart';
import 'pages/welcome_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider(
        create: (context) => MainModel(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
            accentColor: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/'               : (context) => WelcomePage(),
            '/signUp'         : (context) => SignupPage(),
            '/login'          : (context) => LoginPage(),
            '/home'           : (context) => SearchInternshipPage(),

          },
        ));
  }
}
