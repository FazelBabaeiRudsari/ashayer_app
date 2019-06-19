import 'package:flutter/material.dart';
import 'package:connecting/ui/myapp.dart';
import 'package:connecting/extra/layout.dart';
import 'package:connecting/helper/helper.dart';
import 'dart:convert';
import 'package:connecting/model/school.dart';

class HomePage extends StatefulWidget {
  static _HomePageState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_HomePageState>());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<School> schools;

  @override
  Widget build(BuildContext context) {
    FutureBuilder futureBuilder;

    futureBuilder = Helper.createRows();

    return futureBuilder;
  }

  rebuild() {}
}
