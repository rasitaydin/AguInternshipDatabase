import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final mailCont = TextEditingController(text: "");
  final passCont = TextEditingController(text: "");
  final idCont = TextEditingController(text: "");

  @override
  void dispose() {
    mailCont.dispose();
    passCont.dispose();
    idCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text(
        "Sign Up",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),textAlign: TextAlign.center,
      ),
    ),
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
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InputWidget.textField(50, mailCont, "E-mail",  Icons.email, TextInputType.text, null),
                      InputWidget.textField(10, idCont, "Student ID",  Icons.swap_calls, TextInputType.number, null),
                      InputWidget.textField(10, passCont, "Password",  Icons.lock, TextInputType.text, null),
                      InputWidget.button(20, 'SIGN UP', () => signUp(User(mail: mailCont.text, pass: passCont.text, studentID: idCont.text), context)),
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

  void signUp(User user, BuildContext context) async{
    final MainModel _mainModel = Provider.of<MainModel>(context, listen: false);
    var result = await _mainModel.saveUser(user);
    if(result){
      Navigator.pop(context);
    } else{
      //TODO Kayıt Basarısız
    }
  }

}
