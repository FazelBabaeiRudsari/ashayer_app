import 'package:flutter/material.dart';

class MapBar extends StatelessWidget {
  final String title;

  MapBar(this.title);

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  // @override
  // void initState() {
  //   super.initState();
  //   random = Random();
  //   refreshList();
  // }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("map"),
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
                  child: new RefreshIndicator(
                    child: new ListView(
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Center(
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
    );

//      body: Container(),
//    );
  }
}
