import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/pages/add_internship_page.dart';
import 'package:internshipdatabase/pages/edit_profile_page.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/values/constants.dart';

class InternshipDetailsPage extends StatefulWidget {
  @override
  _InternshipDetailsPage createState() => _InternshipDetailsPage();
}

class _InternshipDetailsPage extends State<InternshipDetailsPage> {
  bool _lunch = false;
  bool _paid = false;
  bool _fullTime = false;
  bool _mandatory = false;
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (_selectedPage) {
          if (_selectedPage == 0) {
            ChangePage(_selectedPage);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchInternshipPage()));
          } else if (_selectedPage == 1) {
            ChangePage(_selectedPage);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddInternshipPage()));
          } else if (_selectedPage == 2) {
            ChangePage(_selectedPage);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfilePage()));
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
          "Internship Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
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
                      Text(
                        "Student Info",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                     _buildNameTF(),
                      SizedBox(height: 10.0),
                      _buildSurnameTF(),
                      SizedBox(height: 10.0),
                      _buildGenderTF(),
                      SizedBox(height: 10.0),
                      _buildDepartmentTF(),
                      SizedBox(height: 10.0),
                      _buildAreaTF(),
                      SizedBox(height: 10.0),
                      _buildPhoneTF(),
                      SizedBox(height: 10.0),
                      _buildYearOfStudyTF(),
                      SizedBox(height: 10.0),
                      _buildGpaTF(),
                      SizedBox(height: 10.0),
                      Text(
                        "Internhsip Info",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                      _buildCountryTF(),
                      SizedBox(height: 10.0),
                      _buildCityTF(),
                      SizedBox(height: 10.0),
                      _buildCompanyTF(),
                      SizedBox(height: 10.0),
                      _buildAppliedByTF(),
                      SizedBox(height: 10.0),
                      _buildStartDateTF(),
                      SizedBox(height: 10.0),
                      _buildEndDateTF(),
                      SizedBox(height: 10.0),
                      _buildFreeLunchTF(),
                      SizedBox(height: 10.0),
                      _buildFullTimeTF(),
                      SizedBox(height: 10.0),
                      _buildPaidTF(),
                      SizedBox(height: 10.0),
                      _buildMandatoryTF(),
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Surname",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Gender",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Department",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Phone",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildAreaTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Interest Area",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildYearOfStudyTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Year Of Study",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "GPA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildCountryTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Country",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
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
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "City",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildCompanyTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Company",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildAppliedByTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Applied By",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildStartDateTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Start Date",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildEndDateTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "End Date",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildFreeLunchTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Free Lunch Yes/No",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildFullTimeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Full Time",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildPaidTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Yes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildMandatoryTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            builder: (context, result) {
              return Text(
                "Yes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget homepage() {
    return SearchInternshipPage();
  }

  Widget profile() {
    return EditProfilePage();
  }

  Widget add() {
    return AddInternshipPage();
  }

  void ChangePage(int index) {
    setState(() {
      _selectedPage = index;
      ShowPage();
    });
  }

  Widget ShowPage() {
    if (_selectedPage == 0) {
      return homepage();
    } else if (_selectedPage == 1) {
      return add();
    } else if (_selectedPage == 2) {
      return profile();
    }
  }
}
