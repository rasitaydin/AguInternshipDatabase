
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/values/constants.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
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
                      SizedBox(height: 50.0),
                      _buildEmailTF(),
                      SizedBox(height: 10.0),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildSignUpBtn()
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

  Widget _buildEmailTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: secondBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'E-mail',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          )
        ]);
  }

  Widget _buildPasswordTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0),
          Container(
              alignment: Alignment.centerLeft,
              decoration: secondBoxDecorationStyle,
              height: 50.0,
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ))
        ]);
  }



  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: Colors.grey,
        onPressed: () => print("kayit yap basildi"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }


}
