class User {
  String? name;
  String? email;
  String? image;

  User({this.name, this.email, this.image});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}
