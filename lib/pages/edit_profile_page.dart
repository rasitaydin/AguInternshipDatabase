import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';

import 'add_internship_page.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<EditProfilePage> {
  bool _showMyNumber = true;
  int selectedPage = 0;
  double height = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
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
                      InputWidget.textField(height, null, "Name",  Icons.people, TextInputType.text),
                      InputWidget.textField(height, null, "Surname",  Icons.people, TextInputType.text),
                      InputWidget.textField(height, null, "Student ID",  Icons.assignment_ind, TextInputType.text),
                      InputWidget.textField(height, null, "Gender",  Icons.accessibility, TextInputType.text),
                      InputWidget.textField(height, null, "Department",  Icons.assessment, TextInputType.text),
                      InputWidget.textField(height, null, "Interest Areas",  Icons.account_balance, TextInputType.text),
                      InputWidget.textField(height, null, "Phone",  Icons.phone, TextInputType.phone),
                      InputWidget.checkBox(height, 'Show My Phone Number', _showMyNumber),
                      InputWidget.button(height, 'Update', () => {}, context),
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
  Widget profile(){
    return EditProfilePage();
  }
  Widget add(){
    return AddInternshipPage();
  }

  void ChangePage(int index){
    setState(() {
      selectedPage = index;
    });
  }

  Widget ShowPage(){
    if(selectedPage == 0){
      return homepage();
    } else if(selectedPage == 1){
      return add();
    } else if(selectedPage == 2){
      return profile();
    }
  }

}
