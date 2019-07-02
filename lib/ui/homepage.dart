import 'dart:math';
import 'package:connecting/widget/my_flutter_app_icons.dart' as custicon;
import 'package:connecting/ui/newpage.dart';
import 'package:connecting/ui/secondpage.dart';
import 'package:connecting/helper/SchoolBloc.dart';
import 'package:connecting/helper/variables.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:connecting/helper/helper.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
//  static _HomePageState of(BuildContext context) =>
//      context.ancestorStateOfType(const TypeMatcher<_HomePageState>());

//  final BuildContext appContext;
  final SchoolBloc bloc;

  HomePage(this.bloc);

  @override
  _HomePageState createState() => _HomePageState(this.bloc);
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Future<List<School>> schools;

//  final SchoolBloc bloc;

//  final BuildContext appContext;

  _HomePageState(this.bloc);

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final SchoolBloc bloc;

  @override
  void initState() {
    print("init");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => refreshData());
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
//    this.bloc.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      Text("resumed");
      //do your stuff
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<School>>(
        stream: bloc.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          print(bloc.stream);
          print(snapshot.connectionState);
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text(Variable.ERROR[Variable.DISCONNECTED]);
            case ConnectionState.waiting:
              return new Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return new Text(snapshot.data.toString());
            case ConnectionState.active:
              if (snapshot.hasError) {
                return new Text(
                  Variable.ERROR[Variable.DISCONNECTED],
                  //  '${snapshot.error}',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                );
              }
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _row(context, snapshot.data[index]);
                  },
                );
              }
          }
        });
  }

//
//
//
//
//
//
  Widget _row(BuildContext appContext, School school) {
    final _random = new Random();

    List<Widget> data() {
      List<Widget> widgets = List<Widget>();
      if (school.is_roozane == true) {
        widgets.add(const Icon(custicon.MyFlutterApp.sun));
        widgets.add(SizedBox(
          height: 3.0,
        ));
      } else if (school.is_roozane == false) {
        widgets.add(const Icon(custicon.MyFlutterApp.moon));
        widgets.add(SizedBox(
          height: 3.0,
        ));
      }
      if (school.jensiat == "b") {
        widgets.add(const Icon(custicon.MyFlutterApp.male));
      } else if (school.jensiat == "g") {
        widgets.add(const Icon(custicon.MyFlutterApp.female));
      } else {
        widgets.add(const Icon(custicon.MyFlutterApp.female));

        widgets.add(const Icon(custicon.MyFlutterApp.male));
      }
      return widgets;
    }

//
//
//
    return Material(
      child:
//        RefreshIndicator(
//      child:
//      ListView(children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        maintainState: true,
                        builder: (context) => NewPage(appContext, school)));
              },
              onLongPress: () {
                Navigator.push(
                    appContext,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(school)));
              },
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(7.0, 7.0),
                            blurRadius: 2.0),
                      ]),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(
                            "http://moj-raj.ir/img/school-" +
                                (1 + _random.nextInt(5)).toString() +
                                ".jpg"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Title(
                          color: Colors.black,
                          child: Text(
                            school.name,
                            style: TextStyle(fontSize: 20.0),
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: data(),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(child: Text(school.schoolable.toString())),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ))),
//          floatingActionButton: FloatingActionButton(
//                          child: Icon(
//                            Icons.school,
//                          ),onPressed: () {
//                            HomePage.of(context).initState();
//                            print("yes");
//                          }),
//      ]
//        ),
//      onRefresh:()=> refreshList(
//      ),
////      key: refreshKey,
//    )
    );

//    floatingActionButton: FloatingActionButton(
//                          child: Icon(
//                            Icons.school,
//                          ),onPressed: () {
////                            HomePage.of(context).initState();
////                            print("yes");
////                          }),
  }

  Future<void> refreshData() async {
    print("refresh==============================");
    refreshKey.currentState?.show(atTop: false);
    bloc.sink.add(await Helper.getSchools());
  }
}
