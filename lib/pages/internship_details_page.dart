import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/pages/add_internship_page.dart';
import 'package:internshipdatabase/pages/edit_profile_page.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/values/constants.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';

class InternshipDetailsPage extends StatefulWidget {
  final Internship internship;

  InternshipDetailsPage(this.internship);
  @override
  _InternshipDetailsPage createState() => _InternshipDetailsPage();
}

class _InternshipDetailsPage extends State<InternshipDetailsPage> {
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
                      InputWidget.text(widget.internship.studentData.name + " " + widget.internship.studentData.surname),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.studentData.gender == "F" ? "Female" : "Male"),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.studentData.department),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.studentData.showMyPhone == "Y" ? widget.internship.studentData.phoneNumber : widget.internship.studentData.email),
                      SizedBox(height: 10.0),
                      InputWidget.text("Done in grade ${widget.internship.yearOfStudent} (GPA: ${widget.internship.gpa})"),
                      SizedBox(height: 20.0),
                      Text(
                        "Internhsip Info",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      InputWidget.text(widget.internship.country),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.city),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.company),
                      SizedBox(height: 10.0),
                      InputWidget.text("Applied by ${widget.internship.contactType}"),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.startDate),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.endDate),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.freeLunch == "Y" ? "Free Lunch" : "No Free Lunch"),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.isFullTime == "Y" ? "Full Time" : "Part Time"),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.isPaid == "Y" ? "Paid" : "Not Paid"),
                      SizedBox(height: 10.0),
                      InputWidget.text(widget.internship.isMandatory == "Y" ? "Mandatory" : "Not Mandatory"),
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
                "Surname}",
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
