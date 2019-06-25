import 'package:connecting/model/hoozes.dart';
import 'package:connecting/model/koochro.dart';
import 'package:connecting/model/saabet.dart';

class School {
  int _id;
  String _name;
  dynamic _schoolable;
  int _province_id;
  int _schoolable_id;
  String _schoolable_type; //max=20
  bool _is_roozane;
  int _code_madrese;
  int _code_faza;
  int _sale_tasis;
  String _doore; //max=10
  int _tedad_daneshamooz;
  String _vaziat; //max=50
  String _jensiat; //max=1
  int _tedad_paye_tahsili;
  int _tedad_hamkaran;
  String _noe_fazaye_amoozeshi; //max=10
  int _hooze_namayandegi_id;
  String _updated_at;
  String _created_at;

//  School({this._id, this._schoolable_type, this._name, this._doore});
//  factory School.fromJson(Map<String,dynamic> json){
//    return School(
//      _id:json['_id'] as int,
//      _name:json['name'] as String,
//      _doore:json['doore'] as String,
//        _schoolable_type:json['schoolable_type'] as String
//    );
//  }

  Hooze _hooze;

  Hooze get hooze => _hooze;

  set hooze(Hooze value) {
    _hooze = value;
  }

  Koochro _koochro;

  Koochro get koochro => _koochro;

  set koochro(Koochro value) {
    _koochro = value;
  }

  Saabet _saabet;

  Saabet get saabet => _saabet;

  set saabet(Saabet value) {
    _saabet = value;
  }

  String get name => _name;

  int get id => _id;

  set id(int value) {
    _id = value;
  } //max=100

  int get hooze_namayandegi_id => _hooze_namayandegi_id;

  set hooze_namayandegi_id(int value) {
    _hooze_namayandegi_id = value;
  }

  String get noe_fazaye_amoozeshi => _noe_fazaye_amoozeshi;

  set noe_fazaye_amoozeshi(String value) {
    _noe_fazaye_amoozeshi = value;
  }

  int get tedad_hamkaran => _tedad_hamkaran;

  set tedad_hamkaran(int value) {
    _tedad_hamkaran = value;
  }

  int get tedad_paye_tahsili => _tedad_paye_tahsili;

  set tedad_paye_tahsili(int value) {
    _tedad_paye_tahsili = value;
  }

  String get jensiat => _jensiat;

  set jensiat(String value) {
    _jensiat = value;
  }

  String get vaziat => _vaziat;

  set vaziat(String value) {
    _vaziat = value;
  }

  int get tedad_daneshamooz => _tedad_daneshamooz;

  set tedad_daneshamooz(int value) {
    _tedad_daneshamooz = value;
  }

  String get doore => _doore;

  set doore(String value) {
    _doore = value;
  }

  int get sale_tasis => _sale_tasis;

  set sale_tasis(int value) {
    _sale_tasis = value;
  }

  int get code_faza => _code_faza;

  set code_faza(int value) {
    _code_faza = value;
  }

  int get code_madrese => _code_madrese;

  set code_madrese(int value) {
    _code_madrese = value;
  }

  bool get is_roozane => _is_roozane;

  set is_roozane(bool value) {
    _is_roozane = value;
  }

  String get schoolable_type => _schoolable_type;

  set schoolable_type(String value) {
    _schoolable_type = value;
  }

  dynamic get schoolable => _schoolable;

  set schoolable(dynamic value) {
    _schoolable = value;
  }

  int get schoolable_id => _schoolable_id;

  set schoolable_id(int value) {
    _schoolable_id = value;
  }

  int get province_id => _province_id;

  set province_id(int value) {
    _province_id = value;
  }

  set name(String value) {
    _name = value;
  }

  String get created_at => _created_at;

  set created_at(String value) {
    _created_at = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }
}
