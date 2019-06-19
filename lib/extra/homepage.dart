import 'package:flutter/material.dart';
import 'package:connecting/ui/myapp.dart';
import 'package:connecting/extra/layout.dart';
import 'package:connecting/helper/helper.dart';
import 'dart:convert';
import 'package:connecting/model/school.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<School> schools;

  @override
  Widget build(BuildContext context) {
    return createRows();
  }

  Widget _row(String school) {
    return Text(
      school,
      style: TextStyle(fontSize: 24.0),
    );
  }

  FutureBuilder createRows() {
    return FutureBuilder(
        future: Helper.getSchools(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('Input a URL to start');
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
            case ConnectionState.active:
              return new Text('');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return new Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              } else if (snapshot.hasData) {
                print("______" + snapshot.data);
                return ListView(
                    children: json.decode(snapshot.data).map(_row).toList());
              }
          }
//    schools = await Helper.getSchools();
//    return schools.map(_row).toList();
        });
  }
}
