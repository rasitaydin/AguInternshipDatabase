import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/values/constants.dart';

import 'add_internship_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  bool _rememberMe = true;
  int selectedPage =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        onTap: (int index) { setState((){ this.selectedPage = index; }); },
        iconSize: 35,
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: SizedBox(
              height: 0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: SizedBox(
              height: 0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: SizedBox(
              height: 0,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Edit Profile",
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
                      SizedBox(height: 10.0),
                      _buildNameTF(),
                      SizedBox(height: 10.0),
                      _buildSurnameTF(),
                      SizedBox(height: 10.0),
                      _buildStudenIdTF(),
                      SizedBox(height: 10.0),
                      _buildGenderTF(),
                      SizedBox(height: 10.0),
                      _buildDepartmentTF(),
                      SizedBox(height: 10.0),
                      _buildInterestAreasTF(),
                      SizedBox(height: 10.0),
                      _buildPhoneTF(),
                      SizedBox(height: 20.0),
                      _buildPhoneCheckbox(),
                      SizedBox(height: 20.0),
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

  Widget _buildNameTF() {
    return Column(
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.people, color: Colors.white),
                  hintText: 'Name',
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
    );
  }
  Widget _buildSurnameTF() {
    return Column(
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.people, color: Colors.white),
                  hintText: 'Surname',
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
    );
  }
  Widget _buildStudenIdTF() {
    return Column(
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.assignment_ind, color: Colors.white),
                  hintText: 'Student ID',
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
    );
  }
  Widget _buildGenderTF() {
    return Column(
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
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.accessibility, color: Colors.white),
                  hintText: 'Gender',
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
    );
  }
  Widget _buildDepartmentTF() {
    return Column(
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.assessment, color: Colors.white),
                  hintText: 'Department',
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
    );
  }
  Widget _buildInterestAreasTF() {
    return Column(
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.account_balance, color: Colors.white),
                  hintText: 'Interest Areas',
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
    );
  }
  Widget _buildPhoneTF() {
    return Column(
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
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.phone, color: Colors.white),
                  hintText: 'Phone',
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
    );
  }
  Widget _buildPhoneCheckbox() {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _rememberMe,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Show My Phone Number',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue
            )
          ),
        ],
      ),
    );
  }
  Widget homepage() {
    return SearchInternshipPage();
  }
  Widget profile(){
    return ProfilePage();
  }
  Widget add(){
    return AddInternshipPage();
  }


  void ChangePage(int index){
    setState(() {
      selectedPage =index;
    });
  }

  Widget ShowPage(){
    if(selectedPage==0){
      return homepage();
    }
    else if(selectedPage==1){
      return add();
    }
    else if(selectedPage==2){
      return profile();
    }
  }
}
