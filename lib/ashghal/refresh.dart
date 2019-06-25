import 'dart:async';
import 'package:connecting/extra/homepage.dart';
import 'package:connecting/extra/mapbar.dart';
import 'package:flutter/material.dart';

class Refresh extends StatefulWidget {
  @override
  _RefreshState createState() => new _RefreshState();
}

class _RefreshState extends State<Refresh> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    //network call and setState so that view will render the new values
    print("refresh");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(),
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new TabBarView(
                children: [
                  Tab(
                    child: new RefreshIndicator(
                      child: new ListView(
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Center(
                                child: TabBarView(children: []),
                              )
                            ],
                          )
                        ],
                      ),
                      onRefresh: refreshList,
                      key: refreshKey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
