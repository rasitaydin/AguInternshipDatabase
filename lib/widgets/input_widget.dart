import 'package:flutter/material.dart';

import '../values/constants.dart';

class InputWidget {
  static Widget textField(double height, TextEditingController controller,
      String hint, IconData icon, TextInputType inputType) {
    return Column(
      children: <Widget>[
        SizedBox(height: height),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: secondBoxDecorationStyle,
              height: 50.0,
              child: FutureBuilder<String>(
                builder: (context, result) {
                  return TextFormField(
                    keyboardType: inputType,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(icon, color: Colors.white),
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget checkBox(double height, String title, bool value) {
    return Column(children: <Widget>[
      SizedBox(height: height),
      Container(
        height: 40.0,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.blue),
              child: Checkbox(
                value: value,
                activeColor: Colors.blue,
                checkColor: Colors.white,
                onChanged: (value) {},
              ),
            ),
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
          ],
        ),
      )
    ]);
  }

  static Widget button(double height, String title, VoidCallback onPressed){
    return Column(
      children: <Widget>[
        SizedBox(height: height),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(15.0),
            color: Colors.blue,
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              title,
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
        )
      ],
    );
  }
}
