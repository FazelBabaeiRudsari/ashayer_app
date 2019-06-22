import 'dart:math';

import 'package:connecting/extra/newpage.dart';
import 'package:connecting/helper/SchoolBloc.dart';
import 'package:connecting/helper/helper.dart';
import 'package:connecting/helper/variables.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
//  HomePage() {
//    this.commander = commander;
//  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<School>> schools;
  SchoolBloc bloc;

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => initData());
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SchoolBloc>(context);

    return StreamBuilder<List<School>>(
        stream: bloc.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          print(bloc.stream);
//          print(snapshot.connectionState);
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
                    return _row(context, snapshot.data[index]);
                  },
                );
              }
          }
        });
  }

  Widget _row(BuildContext context, School school) {
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
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => NewPage(school.name)));
      },
    );
  }

  void initData() async {
    bloc.sink.add(await Helper.getSchools());
  }
}
