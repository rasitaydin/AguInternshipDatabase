import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/pages/add_internship_page.dart';
import 'package:internshipdatabase/pages/edit_profile_page.dart';
import 'package:internshipdatabase/values/constants.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';

class SearchInternshipPage extends StatefulWidget {
  @override
  _SearchInternshipPage createState() => _SearchInternshipPage();
}

class _SearchInternshipPage extends State<SearchInternshipPage> {
  bool _lunch = false;
  bool _paid = false;
  bool _fullTime = false;
  bool _mandatory = false;
  int _selectedPage = 0;
  double height = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (_selectedPage) {
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
                      InputWidget.textField(height, null, "Country",  Icons.place, TextInputType.text, null),
                      InputWidget.textField(height, null, "City",  Icons.place, TextInputType.text, null),
                      InputWidget.textField(height, null, "Gender",  Icons.accessibility, TextInputType.text, null),
                      InputWidget.textField(height, null, "Department",  Icons.assessment, TextInputType.text, null),
                      InputWidget.textField(height, null, "Interest Areas",  Icons.account_balance, TextInputType.text, null),
                      InputWidget.textField(height, null, "Minimum GPA",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.textField(height, null, "Year Of Study",  Icons.calendar_today, TextInputType.number, null),
                      InputWidget.checkBox(height, 'Free Lunch', _lunch),
                      InputWidget.checkBox(height, 'Paid', _paid),
                      InputWidget.checkBox(height, 'Full Time', _fullTime),
                      InputWidget.checkBox(height, 'Mandatory', _mandatory),
                      InputWidget.button(height, 'Search', null),
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

  Widget homepage(){
    return SearchInternshipPage();
  }
  Widget profile(){
    return EditProfilePage();
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
