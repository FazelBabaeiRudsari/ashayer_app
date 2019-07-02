import 'dart:io';
import 'package:connecting/ui/homepage.dart';
import 'package:connecting/ui/newpage.dart';
import 'package:connecting/model/koochro.dart';
import 'package:connecting/model/saabet.dart';
import 'package:connecting/model/school.dart';
import 'package:flutter/material.dart';
import 'package:connecting/helper/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connecting/ui/secondpage.dart';
import 'package:path/path.dart';
import 'package:connecting/helper/SchoolBloc.dart';

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
}
