import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/pages/add_internship_page.dart';
import 'package:internshipdatabase/pages/edit_profile_page.dart';
import 'package:internshipdatabase/pages/search_results_page.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';
import 'package:provider/provider.dart';

class SearchInternshipPage extends StatefulWidget {
  @override
  _SearchInternshipPage createState() => _SearchInternshipPage();
}

class _SearchInternshipPage extends State<SearchInternshipPage> {
  int _selectedPage = 0;
  double height = 10.0;

  final countryCont = TextEditingController(text: "");
  final cityCont = TextEditingController(text: "");
  final genderCont = TextEditingController(text: "");
  final depCont = TextEditingController(text: "");
  final gpaCont = TextEditingController(text: "");
  final yearCont = TextEditingController(text: "");
  final lunchCont = TextEditingController(text: "");
  final paidCont = TextEditingController(text: "");
  final fullTimeCont = TextEditingController(text: "");
  final mandatoryCont = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (_selectedPage) {
          changePage(_selectedPage);
          if (_selectedPage == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (_selectedPage == 1) {
            Navigator.pushReplacementNamed(context, '/addInternship');
          } else if (_selectedPage == 2) {
            Navigator.pushReplacementNamed(context, '/editProfile');
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
                      InputWidget.textField(height, countryCont, "Country",
                          Icons.place, TextInputType.text, null),
                      InputWidget.textField(height, cityCont, "City",
                          Icons.place, TextInputType.text, null),
                      InputWidget.textField(height, genderCont, "Gender",
                          Icons.accessibility, TextInputType.text, null),
                      InputWidget.textField(height, depCont, "Department",
                          Icons.assessment, TextInputType.text, null),
                      InputWidget.textField(height, gpaCont, "Minimum GPA",
                          Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, yearCont, "Year Of Study",
                          Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, lunchCont, "Free Lunch",
                          Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, paidCont, "Paid",
                          Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, fullTimeCont, "Full Time",
                          Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, mandatoryCont, "Mandatory",
                          Icons.calendar_today, TextInputType.number, null),
                      InputWidget.button(
                          height,
                          'Search',
                          () => search(Internship(
                              country: countryCont.text,
                              city: cityCont.text,
                              department: depCont.text,
                              gpa: gpaCont.text,
                              yearOfStudent: yearCont.text,
                              freeLunch: lunchCont.text,
                              isPaid: paidCont.text,
                              isFullTime: fullTimeCont.text,
                              isMandatory: mandatoryCont.text))),
                      SizedBox(height: height),
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

  Widget homepage() {
    return SearchInternshipPage();
  }

  Widget profile() {
    return EditProfilePage();
  }

  Widget add() {
    return AddInternshipPage();
  }

  void changePage(int index) {
    setState(() {
      _selectedPage = index;
      showPage();
    });
  }

  Widget showPage() {
    if (_selectedPage == 0) {
      return homepage();
    } else if (_selectedPage == 1) {
      return add();
    } else {
      return profile();
    }
  }

  void search(Internship internship) async {
    final _mainModel = Provider.of<MainModel>(context, listen: false);
    await _mainModel.getInternship(internship);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SearhResultPage(internship)));
  }
}
