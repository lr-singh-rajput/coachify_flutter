class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.email, 
      this.password, 
      this.cname, 
      this.number,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    cname = json['cname'];
    number = json['number'];
  }
  String? id;
  String? name;
  String? email;
  String? password;
  String? cname;
  String? number;
  UserModel copyWith({  String? id,
  String? name,
  String? email,
  String? password,
  String? cname,
  String? number,
}) => UserModel(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
  cname: cname ?? this.cname,
  number: number ?? this.number,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['cname'] = cname;
    map['number'] = number;
    return map;
  }

}