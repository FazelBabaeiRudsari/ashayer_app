import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:connecting/helper/helper.dart';

class HomePage extends StatefulWidget {
  static _HomePageState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_HomePageState>());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
  }

//
//  @override
//  Widget build(BuildContext context) {
//
//  FutureBuilder futureBuilder;
//  futureBuilder = Helper.createRows();
//
//    return Column(
//        children: <Widget>[
//          futureBuilder,
//          new Expanded(
//            child: new RefreshIndicator(
//              child: new ListView(
//
//              ),
//              onRefresh: refreshList,
//              key: refreshKey,
//            ),
//          ),
//        ],
//    );
//  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder futureBuilder;
    futureBuilder = Helper.createRows();
    return futureBuilder;
  }

  rebuild() {}
}
