import 'package:flutter/material.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/pages/internship_details_page.dart';
import 'package:internshipdatabase/viewmodels/main_model.dart';
import 'package:provider/provider.dart';

class SearhResultPage extends StatefulWidget {
  final Internship internship;

  SearhResultPage(this.internship);

  @override
  _SearchInternshipPage2 createState() => _SearchInternshipPage2();
}

class _SearchInternshipPage2 extends State<SearhResultPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final MainModel _mainModel = Provider.of<MainModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Search Internship",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Builder(
              builder: (context) {
                return _buildPersonPart(context, _mainModel);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPersonPart(BuildContext context, MainModel _mainModel) {
    return FutureBuilder<List<Internship>>(
        future: _mainModel.getInternship(widget.internship),
        builder: (context, result) {
          if (result.hasData) {
            var data = result.data;
            return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  Text("Choose Someone",
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
                      itemCount: data.length,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InternshipDetailsPage(
                                                data[index])));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: ListTile(
                                  leading: Text(data[index].company,style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),),
                                  title: Text(
                                    data[index].country,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(data[index].department,style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold), ),
                                ),
                              ),
                            ));
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
        });
  }
}
