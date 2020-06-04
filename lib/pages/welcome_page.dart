
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class WelcomePage extends StatelessWidget {
  void onButtonTwoPressed(BuildContext context) => Navigator.pushReplacementNamed(context, "/login");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [

            Positioned(
              left: 13,
              top: 79,
              right: 12,
              bottom: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Container(
                    height: 110,
                    margin: EdgeInsets.only(left: 11, right: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 52,
                          child: RaisedButton(
                            color: Colors.blue ,
                            onPressed: () => this.onButtonTwoPressed(context),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            textColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "Login",
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
                        ),
                        Container(
                          height: 52,
                          child: RaisedButton(
                            color: Colors.blue ,
                            onPressed: () => this.onButtonTwoPressed(context),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            textColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "Sign Up",
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
