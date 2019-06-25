import 'package:flutter/material.dart';
import 'package:connecting/model/school.dart';


class SecondPage extends StatelessWidget {
  final School school;

  SecondPage(this.school);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(school.name),
        ),
//      body: Column(
//        children: <Widget>[
//          Padding(padding: EdgeInsets.only(top: 20.0)),
////          Text("address"),
//          ListView(
//            children: data(),
//          ),
//        ],
//      ),
//    );
        body: Container(
          padding: EdgeInsets.only(left: 15.0, top: 15.0),
          child:
          Text("hello"),
        ));
  }
}