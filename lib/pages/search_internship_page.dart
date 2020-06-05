import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/pages/add_internship_page.dart';
import 'package:internshipdatabase/pages/profile_page.dart';
import 'package:internshipdatabase/values/constants.dart';

class SearchInternshipPage extends StatefulWidget {
  @override
  _SearchInternshipPage createState() => _SearchInternshipPage();
}

class _SearchInternshipPage extends State<SearchInternshipPage> {
  bool _lunch = false;
  bool _paid = false;
  bool _fullTime = false;
  bool _mandatory = false;
  int _selectedPage =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (_selectedPage) {
          if(_selectedPage==0){
            ChangePage(_selectedPage);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchInternshipPage()));
          }
          else if(_selectedPage==1){
            ChangePage(_selectedPage);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddInternshipPage()));
          }
          else if(_selectedPage==2){
            ChangePage(_selectedPage);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage()));
          }
        },
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
          "Search Internship",
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
                      _buildCountryTF(),
                      SizedBox(height: 10.0),
                      _buildCityTF(),
                      SizedBox(height: 10.0),
                      _buildGenderTF(),
                      SizedBox(height: 10.0),
                      _buildDepartmentTF(),
                      SizedBox(height: 10.0),
                      _buildInterestAreasTF(),
                      SizedBox(height: 10.0),
                      _buildGpaTF(),
                      SizedBox(height: 10.0),
                      _buildYearTF(),
                      SizedBox(height: 20.0),
                      _buildLunchCheckbox(),
                      SizedBox(height: 20.0),
                      _buildPaidCheckbox(),
                      SizedBox(height: 20.0),
                      _buildFullTimeCheckbox(),
                      SizedBox(height: 20.0),
                      _buildMandatoryCheckbox(),
                      SizedBox(height: 20.0),
                      _buildSearchBtn(context),
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

  Widget _buildCountryTF() {
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
                  prefixIcon: Icon(Icons.place, color: Colors.white),
                  hintText: 'Country',
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
  Widget _buildCityTF() {
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
                  prefixIcon: Icon(Icons.place, color: Colors.white),
                  hintText: 'City',
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
  Widget _buildAppliedTF() {
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
                  prefixIcon: Icon(Icons.check_box, color: Colors.white),
                  hintText: 'Applied By (e.g. Linkedin, Kariyer.net)',
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
  Widget _buildYearTF() {
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
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                  hintText: 'Year Of Study',
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
  Widget _buildGpaTF() {
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
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                  hintText: 'GPA',
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
  Widget _buildLunchCheckbox() {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _lunch,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _lunch = value;
                });
              },
            ),
          ),
          Text(
              'Free Lunch',
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
  Widget _buildPaidCheckbox() {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _paid,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _paid = value;
                });
              },
            ),
          ),
          Text(
              'Paid',
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
  Widget _buildFullTimeCheckbox() {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _fullTime,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _fullTime = value;
                });
              },
            ),
          ),
          Text(
              'Full Time',
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
  Widget _buildMandatoryCheckbox() {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _mandatory,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _mandatory = value;
                });
              },
            ),
          ),
          Text(
              'Mandatory',
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
  Widget _buildSearchBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: Colors.blue,
//        onLongPress: () => onLogInLongPressed(mailController.text, passController.text, context),
//        onPressed: () => onLogInPressed(mailController.text, passController.text, context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Search',
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
  Widget homepage(){
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
      _selectedPage =index;
      ShowPage();
    });
  }

  Widget ShowPage(){
    if(_selectedPage==0){
      return homepage();
    }
    else if(_selectedPage==1){
      return add();
    }
    else if(_selectedPage==2){
      return profile();
    }
  }

}
