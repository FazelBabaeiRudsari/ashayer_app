class Koochro {
  int _id;
  String _type; //max=1
  String _address_yeylagh; //max=150
  String _loc_yeylagh; //max=50
  int _fasele_az_shahrestan_yeylagh;
  String _address_gheshlagh; //max=150
  String _loc_gheshlagh; //max=50
  int _fasele_az_shahrestan_gheshlagh;
  String _masire_kooch;
  int _masafate_kooch;
  String _updated_at;
  String _created_at;

  Koochro(
    this._id,
    this._type,
    this._address_yeylagh,
    this._loc_yeylagh,
    this._fasele_az_shahrestan_yeylagh,
    this._address_gheshlagh,
    this._loc_gheshlagh,
    this._fasele_az_shahrestan_gheshlagh,
    this._masire_kooch,
    this._masafate_kooch,
    this._updated_at,
    this._created_at,
  );

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get type => _type;

  String get created_at => _created_at;

  set created_at(String value) {
    _created_at = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }

  int get masafate_kooch => _masafate_kooch;

  set masafate_kooch(int value) {
    _masafate_kooch = value;
  }

  String get masire_kooch => _masire_kooch;

  set masire_kooch(String value) {
    _masire_kooch = value;
  }

  int get fasele_az_shahrestan_gheshlagh => _fasele_az_shahrestan_gheshlagh;

  set fasele_az_shahrestan_gheshlagh(int value) {
    _fasele_az_shahrestan_gheshlagh = value;
  }

  String get loc_gheshlagh => _loc_gheshlagh;

  set loc_gheshlagh(String value) {
    _loc_gheshlagh = value;
  }

  String get address_gheshlagh => _address_gheshlagh;

  set address_gheshlagh(String value) {
    _address_gheshlagh = value;
  }

  int get fasele_az_shahrestan_yeylagh => _fasele_az_shahrestan_yeylagh;

  set fasele_az_shahrestan_yeylagh(int value) {
    _fasele_az_shahrestan_yeylagh = value;
  }

  String get loc_yeylagh => _loc_yeylagh;

  set loc_yeylagh(String value) {
    _loc_yeylagh = value;
  }

  String get address_yeylagh => _address_yeylagh;

  set address_yeylagh(String value) {
    _address_yeylagh = value;
  }

  set type(String value) {
    _type = value;
  }
}
