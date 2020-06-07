import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/pages/search_internship_page.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:internshipdatabase/widgets/input_widget.dart';
import 'package:provider/provider.dart';

import 'add_internship_page.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<EditProfilePage> {
  bool _showMyNumber = true;
  int selectedPage = 0;
  double height = 10.0;

  TextEditingController nameCont;
  TextEditingController surnameCont;
  TextEditingController idCont;
  TextEditingController genderCont;
  TextEditingController departmentCont;
  TextEditingController phoneCont;
  bool showMyPhone = true;

  @override
  void dispose() {
    nameCont.dispose();
    surnameCont.dispose();
    idCont.dispose();
    genderCont.dispose();
    departmentCont.dispose();
    phoneCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _mainModel = Provider.of<MainModel>(context);
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
                  child: FutureBuilder<Student>(
                    future: _mainModel.getStudent(_mainModel.user.mail),
                    builder: (context, data) {
                      if(data.hasData){
                        Student _student = data.data;
                        nameCont = TextEditingController(text: _student.name);
                        surnameCont = TextEditingController(text: _student.surname);
                        idCont = TextEditingController(text: _student.studentID.toString());
                        genderCont = TextEditingController(text: _student.gender);
                        departmentCont = TextEditingController(text: _student.department);
                        phoneCont = TextEditingController(text: _student.phoneNumber);

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InputWidget.textField(height, nameCont, "Name",  Icons.people, TextInputType.text, _student.name),
                            InputWidget.textField(height, surnameCont, "Surname",  Icons.people, TextInputType.text, _student.surname),
                            InputWidget.textField(height, idCont, "Student ID",  Icons.assignment_ind, TextInputType.text, _student.studentID.toString()),
                            InputWidget.textField(height, genderCont, "Gender",  Icons.accessibility, TextInputType.text, _student.gender),
                            InputWidget.textField(height, departmentCont, "Department",  Icons.assessment, TextInputType.text, _student.department),
                            InputWidget.textField(height, phoneCont, "Phone",  Icons.phone, TextInputType.phone, _student.phoneNumber),
                            checkBox(),
                            InputWidget.button(height, 'Update', () => update(Student(
                              studentID: int.parse(idCont.text),
                              name: nameCont.text,
                              surname: surnameCont.text,
                              gender: genderCont.text,
                              department: departmentCont.text,
                              phoneNumber: phoneCont.text,
                              showMyPhone: showMyPhone ? "Y" : "N"
                            ))),
                            SizedBox(height: height),
                          ],
                        );
                      } else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
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

  void update(Student student) async{
    final _mainModel = Provider.of<MainModel>(context, listen: false);
    _mainModel.updateStudent(student);
  }

  Widget checkBox() {
    return Column(children: <Widget>[
      SizedBox(height: height),
      Container(
        height: 40.0,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.blue),
              child: Checkbox(
                value: showMyPhone,
                activeColor: Colors.blue,
                checkColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    showMyPhone = value;
                  });
                },
              ),
            ),
            Text("Show My Phone Number",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
          ],
        ),
      )
    ]);
  }

}
