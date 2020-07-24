class Employee {
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  String _mobileNo;
  String _address;
  String _imageU;

  Employee(this._firstName, this._lastName, this._email, this._mobileNo,
      this._address, this._imageU);

  Employee.map(dynamic obj) {
    this._id = obj['id'];
    this._firstName = obj['firstName'];
    this._lastName = obj['lastName'];
    this._email = obj['email'];
    this._mobileNo = obj['mobileNo'];
    this._address = obj['address'];
    this._imageU = obj['imageU'];
  }

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get mobileNo => _mobileNo;
  String get address => _address;
  String get imageU => _imageU;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['mobileNo'] = _mobileNo;
    map['address'] = _address;
    map['imageU'] = _imageU;

    return map;
  }

  Employee.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._firstName = map['firstName'];
    this._lastName = map['lastName'];
    this._email = map['email'];
    this._mobileNo = map['mobileNo'];
    this._address = map['address'];
    this._imageU = map['imageU'];
  }
}
