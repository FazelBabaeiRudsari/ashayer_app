class Saabet{

  int _id;
  String _address;//max=150
  String _loc;//max=50
  int _fasele_az_shahrestan;
  String _updated_at;
  String _created_at;

  Saabet(this._id);



  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get address => _address;

  String get created_at => _created_at;

  set created_at(String value) {
    _created_at = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }

  int get fasele_az_shahrestan => _fasele_az_shahrestan;

  set fasele_az_shahrestan(int value) {
    _fasele_az_shahrestan = value;
  }

  String get loc => _loc;

  set loc(String value) {
    _loc = value;
  }

  set address(String value) {
    _address = value;
  }

}