import 'dart:io';

import 'package:connecting/extra/newpage.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:connecting/helper/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import 'package:path/path.dart';

class Helper {
  String _TOKEN = '';
  static var client = http.Client();

  set token(String value) {
    _TOKEN = value;
  }

  String get token => _TOKEN;

  static getLink(String command) {
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
//      return response.body;

      List<School> schools = List<School>();
//              print(parsedJson);
      for (final tmp in parsedJson["data"]) {
        School s = School();
//        print(s);
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
//        print(s.id);
        schools.add(s);
      }
      return schools;
//          for (final ss in schools) print(ss);
//      print(response.body);
    });
  }

  static List<School> createSchools(dynamic data) {
    var parsedJson = json.decode(data);
    int page = parsedJson["current_page"];

    List<School> schools = List<School>();

//    for (final tmp in json.decode(parsedJson)) {
//      print(tmp["data"]);
//      print(tmp["current_page"]);
//    }

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
//                print(school.id);
      schools.add(s);
    }
    return schools;
  }

  static Widget _row(BuildContext context, School school) {
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
                  Variable.ERROR[Variable.DISCONNECTED],
                  //  '${snapshot.error}',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                );
              }
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
//            print("______" + snapshot.data);
//                print("______________" + json.decode(snapshot.data).toString());
                return ListView.builder(
//              scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _row(context, snapshot.data[index]);
                  },
                );
              }
          }
//    schools = await Helper.getSchools();
//    return schools.map(_row).toList();
        });
  }
}
