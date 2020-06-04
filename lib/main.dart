import 'package:flutter/material.dart';
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
            '/'               : (context) => WelcomePage(),

          },
        );
  }
}
