import 'dart:async';

import 'package:connecting/model/school.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class SchoolBloc implements BlocBase {
  //sink = input   stream=output
  final _schoolStreamController = BehaviorSubject<List<School>>();

  Sink<List<School>> get sink => _schoolStreamController.sink;

  Stream<List<School>> get stream => _schoolStreamController.stream;

//  final schoolsSubject = BehaviorSubject<List<School>>();

  SchoolBloc() {
//    print("listening");

    _schoolStreamController.stream.listen(null);
//    schoolsSubject.close();
  }

  void onData(String event) {}

  @override
  void dispose() {
    _schoolStreamController.close();
    print("closed");
  }

  void _handleCommand(String event) {
//    sink.add("2");
  }
}

Type _typeOf<T>() => T;

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
    _BlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
