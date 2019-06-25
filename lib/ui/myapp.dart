import 'package:connecting/ashghal/refresh.dart';
import 'package:connecting/extra/mapbar.dart';
import 'package:flutter/material.dart';
import 'package:connecting/extra/homepage.dart';
import 'package:connecting/model/school.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    //network call and setState so that view will render the new values
  }

//  Future<void> a = Helper.getToken();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                bottom: (TabBar(
//                    isScrollable: true,
                  tabs: [
                    Tab(
                        icon: Icon(
                      Icons.home,
                    )),
                    Tab(icon: Icon(Icons.map))
                  ],
                )),
                title: Text("Madrese Ashayer"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      //TODO:
                    },
                  ),
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text("Username"),
                      accountEmail: Text("Email Adress"),
                      currentAccountPicture: CircleAvatar(
//              Image.asset("images/1.jpg"),
                        backgroundColor:
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? Colors.purple
                                : Colors.white,
                        child: Text("U N"),
                      ),
                      otherAccountsPictures: <Widget>[
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? Colors.purple
                                  : Colors.white,
                          child: Text("2"),
                        ),
                      ],
                    ),
                    ListTile(
                        title: Text("Page One"),
                        trailing: Icon(Icons.arrow_upward),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed("/a");
                        }),
                    ListTile(
                      title: Text("Page Two"),
                      trailing: Icon(Icons.arrow_downward),
                      onTap: () {
//                          Navigator.of(context).pop();
//                          Navigator.of(context).push(MaterialPageRoute(
//                              builder: (BuildContext context) =>
//                                  NewPage("Page Two")));
//                 Navigator.of(context).pushNamed("/b");
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Close"),
                      trailing: Icon(Icons.close),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    ListTile(
                      title: Text("about as"),
                      trailing: Icon(Icons.extension),
                    ),
                  ],
                ),
              ),
              body: new Column(
                children: <Widget>[
                  new Expanded(
//                      floatingActionButton: FloatingActionButton(
//                          child: Icon(
//                            Icons.school,
//                          ),
//                          onPressed: () {
//                            HomePage.of(context).initState();
//                            print("yes");
//                          }),

                    child: new TabBarView(
                      children: [
                        HomePage(),
                        MapBar("hello"),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
