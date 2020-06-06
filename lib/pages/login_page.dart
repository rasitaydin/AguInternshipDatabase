import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/values/constants.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mailCont = TextEditingController(text: "");
  final passCont = TextEditingController(text: "");

  @override
  void dispose() {
    mailCont.dispose();
    passCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.redAccent,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 90.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          '      Sign In       ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InputWidget.textField(50, mailCont, "E-mail",  Icons.email, TextInputType.text),
                      InputWidget.textField(10, passCont, "Password",  Icons.lock, TextInputType.text),
                      InputWidget.button(20, 'LOGIN', () => login(User(mail: mailCont.text, pass: passCont.text), context)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(User user, BuildContext context) async{
    MainModel _mainModel = Provider.of<MainModel>(context, listen: false);
    var result = await _mainModel.login(user);
    if(result){
      _mainModel.user = user;
      _mainModel.getStudent(user.studentID);
      Navigator.pushReplacementNamed(context, '/home');
    } else{
      //TODO Giris Basarısız
    }
  }
}
