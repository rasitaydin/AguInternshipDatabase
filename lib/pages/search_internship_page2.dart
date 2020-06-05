import 'package:flutter/material.dart';
import 'package:internshipdatabase/pages/internship_details_page.dart';



class SearchInternshipPage2 extends StatefulWidget{
  @override
  _SearchInternshipPage2 createState() =>  _SearchInternshipPage2();
}

class _SearchInternshipPage2 extends State<SearchInternshipPage2>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<User> filteredUsers = List();
  String _selectedName = "Select Student";

  @override
  Widget build(BuildContext context) {
    final UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Search Internship",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Builder(
              builder: (context){
                return _buildPersonPart(context, _userModel);
              },
            ),
          )
        ],

      ),
    );
  }
  Widget _buildPersonPart(BuildContext context, UserModel _userModel) {
    Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<User>>(
      future: _userModel.getConnections(_userModel.user),
      builder: (context, data) {
        if (data.hasData) {
          filteredUsers = data.data;
          return Container(
            alignment: Alignment.center,
            color: Colors.blue,
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Text("Birisini Seç",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans')),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: filteredUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, right: 15, left: 15),
                          color: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => InternshipDetailsPage(_userModel.connection)));
//
                            },
                            child:Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: ListTile(
                                leading: Text("Name Surname"),
                                title: Text(
                                  "Company",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedName = filteredUsers[index].name;
                                  });
                                },
                              ),
                            ) ,
                          )


                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}