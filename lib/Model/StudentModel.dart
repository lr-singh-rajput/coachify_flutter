class StudentModel {
  StudentModel({
      this.id, 
      this.name,
      this.fname,
      this.number,
      this.money, 
      this.total, 
      this.paid, 
      this.due,});

  StudentModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    fname = json['fname'];
    number = json['number'];
    money = json['money'];
    total = json['total'];
    paid = json['paid'];
    due = json['due'];
  }
  String? id;
  String? name;
  String? fname;
  String? number;
  String? money;
  String? total;
  String? paid;
  String? due;
StudentModel copyWith({  String? id,
  String? name,
  String? fname,
  String? number,
  String? money,
  String? total,
  String? paid,
  String? due,
}) => StudentModel(  id: id ?? this.id,
  name: name ?? this.name,
  fname: fname ?? this.fname,
  number: number ?? this.number,
  money: money ?? this.money,
  total: total ?? this.total,
  paid: paid ?? this.paid,
  due: due ?? this.due,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['fname'] = fname;
    map['number'] = number;
    map['money'] = money;
    map['total'] = total;
    map['paid'] = paid;
    map['due'] = due;
    return map;
  }

}