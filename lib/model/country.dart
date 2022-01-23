class Country {
  String? name;
  String? dialCode;
  String? code;

  Country({this.name, this.dialCode, this.code});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dial_code'] = dialCode;
    data['code'] = code;
    return data;
  }
}
