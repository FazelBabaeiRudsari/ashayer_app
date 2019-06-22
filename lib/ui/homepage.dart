import 'dart:math';

import 'package:connecting/extra/newpage.dart';
import 'package:connecting/helper/SchoolBloc.dart';
import 'package:connecting/helper/helper.dart';
import 'package:connecting/helper/variables.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  final BuildContext appContext;
  final SchoolBloc bloc;

  HomePage(this.appContext, this.bloc);

  @override
  _HomePageState createState() => _HomePageState(this.bloc);
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Future<List<School>> schools;
  final SchoolBloc bloc;

  _HomePageState(this.bloc);

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
    this.bloc.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      //do your stuff
    }
  }

  @override
  Widget build(BuildContext appContext) {
    return StreamBuilder<List<School>>(
        stream: bloc.stream,
        builder: (BuildContext appContext, AsyncSnapshot snapshot) {
//          print(bloc.stream);
          print(snapshot.connectionState);
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text(Variable.ERROR[Variable.DISCONNECTED]);
            case ConnectionState.waiting:
              return new Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return new Text('done');
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
//                print(snapshot.data);
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _row(appContext, snapshot.data[index]);
                  },
                );
              }
          }
        });
  }

  Widget _row(BuildContext appContext, School school) {
    final _random = new Random();

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("http://moj-raj.ir/img/school-" +
            (1 + _random.nextInt(5)).toString() +
            ".jpg"),
      ),
      title: Text(school.name),
      subtitle: Text(school.schoolable_type),
      onTap: () {
        Navigator.push(
            appContext,
            MaterialPageRoute(
                maintainState: true,
                builder: (context) {
                  return NewPage(appContext, school.name);
                }));
//        refreshData();
      },
    );
  }

  void refreshData() async {
//    print("refresh data");
    bloc.sink.add(await Helper.getSchools());
  }
}
