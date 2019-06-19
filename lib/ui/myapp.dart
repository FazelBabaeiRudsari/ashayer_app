import 'package:flutter/material.dart';
import 'package:connecting/extra/layout.dart';
import 'package:connecting/extra/homepage.dart';
import 'package:connecting/helper/helper.dart';
import 'package:connecting/helper/variables.dart';
import 'dart:convert';
import 'package:connecting/model/school.dart';
import 'package:connecting/extra/newpage.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  Future<void> a = Helper.getToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            //TODO:
          },
        ),
        title: Text("Madrese Ashayer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //TODO:
            },
          )
        ],
      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text("Username"),
//              accountEmail: Text("Email Adress"),
//              currentAccountPicture: CircleAvatar(
////              Image.asset("images/1.jpg"),
//                backgroundColor:
//                    Theme.of(context).platform == TargetPlatform.iOS
//                        ? Colors.deepPurple
//                        : Colors.white,
//                child: Text("U N"),
//              ),
//              otherAccountsPictures: <Widget>[
//                CircleAvatar(
//                  backgroundColor:
//                      Theme.of(context).platform == TargetPlatform.iOS
//                          ? Colors.deepPurple
//                          : Colors.white,
//                  child: Text("2"),
//                ),
//              ],
//            ),
//            ListTile(
//                title: Text("Page One"),
//                trailing: Icon(Icons.arrow_upward),
//                onTap: () {
//                  Navigator.of(context).pop();
//                  Navigator.of(context).pushNamed("/a");
//                }),
//            ListTile(
//              title: Text("Page Two"),
//              trailing: Icon(Icons.arrow_downward),
//              onTap: () {
//                Navigator.of(context).pop();
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (BuildContext context) => NewPage("Page Two")));
////                 Navigator.of(context).pushNamed("/b");
//              },
//            ),
//            Divider(),
//            ListTile(
//              title: Text("Close"),
//              trailing: Icon(Icons.close),
//              onTap: () => Navigator.of(context).pop(),
//            ),
//            ListTile(
//              title: Text("about as"),
//              trailing: Icon(Icons.extension),
//            ),
//          ],
//        ),
//      ),
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.school,
          ),
          onPressed: () {
            HomePage.of(context).initState();
//            HomePage.of(context).build(context);
//            Helper.createRows();
            print("yes");
          }),
    );
  }
}
