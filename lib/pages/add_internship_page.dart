import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/pages/edit_profile_page.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/values/constants.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';
import 'package:provider/provider.dart';

class AddInternshipPage extends StatefulWidget {
  @override
  _AddInternshipPage createState() => _AddInternshipPage();
}

class _AddInternshipPage extends State<AddInternshipPage> {

  double height = 10.0;

  final countryCont = TextEditingController(text: "");
  final cityCont = TextEditingController(text: "");
  final companyCont = TextEditingController(text: "");
  final departmentCont = TextEditingController(text: "");
  final contactType = TextEditingController(text: "");
  final genderCont = TextEditingController(text: "");
  final contactInfoCont = TextEditingController(text: "");
  final gpaCont = TextEditingController(text: "");
  final yearCont = TextEditingController(text: "");
  final lunchCont = TextEditingController(text: "");
  final startCont = TextEditingController(text: "");
  final endCont = TextEditingController(text: "");
  final paidCont = TextEditingController(text: "");
  final fullTimeCont = TextEditingController(text: "");
  final mandatoryCont = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        onTap:  (_selectedPage) {
          ChangePage(_selectedPage);
          if(_selectedPage==0){
            Navigator.pushReplacementNamed(context, '/home');
          }
          else if(_selectedPage==1){
            Navigator.pushReplacementNamed(context, '/addInternship');
          }
          else if(_selectedPage==2){
            Navigator.pushReplacementNamed(context, '/editProfile');
          }
        },
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
          "Add Internship",
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
                      InputWidget.textField(height, countryCont, "Country",  Icons.place, TextInputType.text, null),
                      InputWidget.textField(height, cityCont, "City",  Icons.place, TextInputType.text, null),
                      InputWidget.textField(height, companyCont, "Company Name",  Icons.account_balance, TextInputType.text, null),
                      InputWidget.textField(height, departmentCont, "Department of Company",  Icons.assessment, TextInputType.text, null),
                      InputWidget.textField(height, contactType, "Contact Type",  Icons.check_box, TextInputType.text, null),
                      InputWidget.textField(height, contactInfoCont, "Contact Info",  Icons.check_box, TextInputType.text, null),
                      InputWidget.textField(height, startCont, "Start Date",  Icons.date_range, TextInputType.datetime, null),
                      InputWidget.textField(height, endCont, "End Date",  Icons.date_range, TextInputType.text, null),
                      InputWidget.textField(height, yearCont, "Year Of Study",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, gpaCont, "GPA",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, lunchCont, "Free Lunch",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, paidCont, "Paid",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, fullTimeCont, "Full Time",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, mandatoryCont, "Mandatory",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.button( height, 'Confirm', () => saveInternship(Internship(country: countryCont.text,
                      city: cityCont.text, company: companyCont.text, department: departmentCont.text, contactType: contactType.text,
                      startDate: startCont.text, endDate: endCont.text, yearOfStudent: yearCont.text, gpa: gpaCont.text, freeLunch: lunchCont.text,
                      isPaid: paidCont.text, isFullTime: fullTimeCont.text, isMandatory: mandatoryCont.text, contactInfo: contactInfoCont.text))),
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

  void saveInternship (Internship internship) async{
    final _mainModel = Provider.of<MainModel>(context, listen: false);
    internship.student = _mainModel.user.studentID;
    await _mainModel.saveInternship(internship);
  }

  Widget homepage() {
    return SearchInternshipPage();
  }
  Widget profile(){
    return EditProfilePage();
  }
  Widget add(){
    return AddInternshipPage();
  }

  int selectedPage =0;
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
