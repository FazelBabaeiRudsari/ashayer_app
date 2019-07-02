import 'dart:async';
import 'package:connecting/ui/homepage.dart';
import 'package:connecting/ui/mapbar.dart';
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
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: new Column(
          children: <Widget>[
                     RefreshIndicator(
                      child: new ListView(
                        children: <Widget>[
                          new InkWell(
                              child: Center(
                                child: TabBarView(children: [
                                ]),
                              )
                          )
                        ],
                      ),
                      onRefresh: refreshList,
                      key: refreshKey,
                    ),
                ],
            ),
      ),
    );
  }
}
