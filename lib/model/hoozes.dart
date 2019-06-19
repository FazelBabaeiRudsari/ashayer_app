class Hooze {
  int _id;
  String _name;//max=100
  int _parent_id;
  String _updated_at;
  String _created_at;

  Hooze(this._name);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get parent_id => _parent_id;

  set parent_id(int value) {
    _parent_id = value;
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
