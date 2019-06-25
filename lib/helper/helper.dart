import 'dart:io';
import 'package:connecting/extra/formcard.dart';
import 'package:connecting/extra/homepage.dart';
import 'package:connecting/extra/newpage.dart';
import 'package:connecting/model/koochro.dart';
import 'package:connecting/model/saabet.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:connecting/helper/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:connecting/extra/secondpage.dart';
import 'package:path/path.dart';
import 'package:connecting/extra/my_flutter_app_icons.dart' as custicon;

class Helper {
  String _TOKEN = '';
  static var client = http.Client();

  set token(String value) {
    _TOKEN = value;
  }

  String get token => _TOKEN;

  static String getLink(String command) {
    switch (command) {
      case "schools":
        {
          return Variable.SCHOOLS;
        }
        break;
    }
  }

//  Future<Post> createPost(String url, {Map body}) async {
//    return http.post(getLink(Variable.COMMAND_SCHOOLS), body: body).then((http.Response response) {
//      final int statusCode = response.statusCode;
//
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        throw new Exception("Error while fetching data");
//      }
//      return Post.fromJson(json.decode(response.body));
//    });
//  }
  static Future<void> getToken() async {
    Map map = Map<String, String>();

//    try {
    return client.get(Variable.DOMAIN).then((http.Response response) {
      Variable.token =
          // (response.headers['set-cookie'].split(";")[0].split("N=")[1]);
          (response.headers['set-cookie']);
      print(Variable.token);
      // print(response.headers);
    });
//    } catch (exception) {}
  }

  static Future<List<School>> getSchools() {
//    getToken();
    Map header = Map<String, String>();
    Map body = Map<String, dynamic>();

    // map["X-XSRF-TOKEN"] = Uri.encodeComponent(Variable.token);
    // map["X-XSRF-TOKEN"] = Variable.token;

    // if (Variable.token != "")
    return client.post(getLink(Variable.COMMAND_SCHOOLS), headers: {
      // "cookie": (Variable.token),
      // "X-XSRF-TOKEN": (Variable.token.split(";")[0].split("N=")[1])
    }, body: {
      'direction': "DESC",
      'doore': "",
      'hooze_namayandegi_id': '',
      'is_roozane': "",
      'jensiat': "",
      'name': "",
      'noe_fazaye_amoozeshi': '',
      // 'sale_tasis': {'min': 1300, 'max': 1500},
      'schoolable': "",
      'sortBy': "sale_tasis",
      // 'tedad_daneshamooz': {'min': 0, 'max': 1000},
      'vaziat': '',
    }).then((http.Response response) {
      var parsedJson = json.decode(response.body);
//
//
//
      List<School> schools = List<School>();
      for (final tmp in parsedJson["data"]) {
        School s = School();
        s.id = tmp["id"];
        s.province_id = tmp["province_id"];
        s.schoolable_id = tmp["schoolable_id"];
        s.schoolable_type = tmp["schoolable_type"];
        s.is_roozane = tmp["is_roozane"] == 1 ? true : false;
        s.name = tmp["name"];
        s.code_madrese = tmp["code_madrese"];
        s.code_faza = tmp["code_faza"];
        s.sale_tasis = tmp["sale_tasis"];
        s.doore = tmp["doore"];
        s.tedad_daneshamooz = tmp["tedad_daneshamooz"];
        s.vaziat = tmp["vaziat"];
        s.tedad_paye_tahsili = tmp["tedad_paye_tahsili"];
        s.jensiat = tmp["jensiat"];
        s.tedad_hamkaran = tmp["tedad_hamkaran"];
        s.noe_fazaye_amoozeshi = tmp["noe_fazaye_amoozeshi"];
        s.hooze_namayandegi_id = tmp["hooze_namayandegi_id"];
        s.created_at = tmp["created_at"];
        s.updated_at = tmp["updated_at"];
//
//
//
//
//
//
//
        Map<String, dynamic> schoolable = tmp["schoolable"];
        if (s.schoolable_type == "App\\Saabet") {
          s.schoolable = Saabet(
              schoolable["id"],
              schoolable["address"],
              schoolable["loc"],
              schoolable["fasele_az_shahrestan"],
              schoolable["updated_at"],
              schoolable["created_at"]);
        } else if (s.schoolable_type == "App\\Koochro") {
          s.schoolable = Koochro(
            schoolable["id"],
            schoolable["type"],
            schoolable["address_yeylagh"],
            schoolable["loc_yeylagh"],
            schoolable["fasele_az_shahrestan_yeylagh"],
            schoolable["address_gheshlagh"],
            schoolable["loc_gheshlagh"],
            schoolable["fasele_az_shahrestan_gheshlagh"],
            schoolable["masire_kooch"],
            schoolable["masafate_kooch"],
            schoolable["updated_at"],
            schoolable["created_at"],
          );
        }
        schools.add(s);
      }
      return schools;
    });
  }

//
//
//
//
//
//

  static Widget _row(BuildContext context, School school) {
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
      child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewPage(school)));
          },
          onLongPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage(school)));
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
    );
  }

//
//
//
//
//
//
  static FutureBuilder createRows() {
    return FutureBuilder(
        future: Helper.getSchools(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text(Variable.ERROR[Variable.DISCONNECTED]);
            case ConnectionState.waiting:
              return new Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return new Text('');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return new Text(
                  Variable.ERROR[Variable.FAULT],
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                );
              }
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
//                return ScrollIndicator(
//                    onLoadMore: onLoadMore,
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _row(context, snapshot.data[index]);
                  },
//                ),
                );
              }
          }
        });
  }
}
