import 'dart:math';
import 'package:connecting/extra/newpage.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:connecting/extra/my_flutter_app_icons.dart' as custicon;

class FormCard extends StatelessWidget {
  final _random = new Random();
  final School school;

  FormCard(this.school);

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding:
//          EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0, bottom: 40.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 5.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 20.0),
                blurRadius: 5.0),
          ]),
//      child: Padding(
//        padding:
//        EdgeInsets.only(bottom:0.0),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: data()
//            SizedBox(height: 25,),

//            SizedBox(height: 20,),
//            SizedBox(height: 10.0,),

              ),
    );
  }

  List<Widget> data() {
    List<Widget> widgets = List<Widget>();
    widgets.add(ClipRect(
        child: Image.network("http://moj-raj.ir/img/school-" +
            (1 + _random.nextInt(5)).toString() +
            ".jpg")));
    if (school.schoolable_type == "App\\Saabet") {
      if (school.is_roozane == true) {
        widgets.add(const Icon(custicon.MyFlutterApp.sun));
//        widgets.add(SizedBox(height: 3.0,));
      } else if (school.is_roozane == false) {
        widgets.add(const Icon(custicon.MyFlutterApp.moon));
//        widgets.add(SizedBox(height: 3.0,));
      }
      if (school.jensiat == "pesar") {
        widgets.add(const Icon(custicon.MyFlutterApp.male));
      } else {
        widgets.add(const Icon(custicon.MyFlutterApp.female));
      }
      widgets.add(Text(
        school.schoolable.id.toString(),
        style: TextStyle(fontSize: 12.0),
      ));
//      widgets.add(SizedBox(height: 5.0,));
      widgets.add(
          Text(school.schoolable.address, style: TextStyle(fontSize: 12.0)));
//      widgets.add(SizedBox(height: 5.0,));
      widgets
          .add(Text(school.schoolable.loc, style: TextStyle(fontSize: 12.0)));
//      widgets.add(SizedBox(height: 5.0,));
      widgets.add(Text(school.schoolable.fasele_az_shahrestan.toString(),
          style: TextStyle(fontSize: 12.0)));
//      widgets.add(SizedBox(height: 5.0,));
      widgets.add(Text(school.schoolable.updated_at));
//      widgets.add(SizedBox(height: 5.0,));
      widgets.add(Text(school.schoolable.created_at));
//      widgets.add(SizedBox(height: 5.0,));
    } else if (school.schoolable_type == "App\\Koochro") {
      if (school.is_roozane == true) {
        widgets.add(const Icon(custicon.MyFlutterApp.sun));
      } else if (school.is_roozane == false) {
        widgets.add(const Icon(custicon.MyFlutterApp.moon));
      }
      if (school.jensiat == "pesar") {
        widgets.add(const Icon(custicon.MyFlutterApp.male));
      } else {
        widgets.add(const Icon(custicon.MyFlutterApp.female));
      }
      widgets.add(Text(school.schoolable.id.toString()));
      widgets.add(Text(school.schoolable.type));
      widgets.add(Text(school.schoolable.address_yeylagh));
      widgets.add(Text(school.schoolable.loc_yeylagh));
      widgets
          .add(Text(school.schoolable.fasele_az_shahrestan_yeylagh.toString()));
      widgets.add(Text(school.schoolable.address_gheshlagh));
      widgets.add(Text(school.schoolable.loc_gheshlagh));
      widgets.add(
          Text(school.schoolable.fasele_az_shahrestan_gheshlagh.toString()));
      widgets.add(Text(school.schoolable.masire_kooch));
      widgets.add(Text(school.schoolable.masafate_kooch.toString()));
      widgets.add(Text(school.schoolable.updated_at));
      widgets.add(Text(school.schoolable.created_at));
    }
    return widgets;
  }
}
