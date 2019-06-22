import 'package:connecting/helper/SchoolBloc.dart';
import 'package:connecting/helper/helper.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

//@immutable
//class AppState {
//  final command;
//
//  AppState(this.command);
//}
//
//enum Actions { Refresh }
//
//AppState commander(AppState prev, action) {
//  if (action == Actions.Refresh) {
////    print(Variable.COMMAND_REFRESH_SCHOOLS);
//    return AppState(Variable.COMMAND_REFRESH_SCHOOLS);
//  }
//  return prev;
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  Future<void> a = Helper.getToken();
//  final store = Store(commander,
//      initialState: AppState(Variable.COMMAND_REFRESH_SCHOOLS));
  BuildContext appContext;

  @override
  void dispose() {
    super.dispose();
  }

//  var schoolsBuilder = Helper.createRows();

  @override
  Widget build(BuildContext context) {
    appContext = context;
    SchoolBloc bloc;
    bloc ??= SchoolBloc();

//    bloc.sink.add(Helper.getSchools());
//    return StoreProvider<dynamic>(
//      store: store,
//      child: Scaffold(
    return BlocProvider<SchoolBloc>(
      bloc: bloc,
      child: Scaffold(
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
//        body: StoreConnector(
//          converter: (store) => store.state.command,
//          builder: (context, commander) => HomePage(),
//        ),
        body: HomePage(appContext, bloc),

        //
//      floatingActionButton: StoreConnector(
//        converter: (store) {
//          return () => store.dispatch(Actions.Refresh);
//        },
//        builder: (context, callback) => FloatingActionButton(
//            child: Icon(
//              Icons.school,
//            ),
//            onPressed: callback),
//      )
//    )
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.school,
          ),
          onPressed: () async {
//            List<School> a = await Helper.getSchools();
//            bloc.sink.add(await Future.delayed(const Duration(seconds: 3)));
            bloc.sink.add(await Helper.getSchools());
          },
        ),
      ),
    );
  }
}
