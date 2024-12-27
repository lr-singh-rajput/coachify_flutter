class ClassModel {
  ClassModel({
      this.id, 
      this.classn,
      this.subclass, 
      this.total, 
      this.paid, 
      this.due,});

  ClassModel.fromJson(dynamic json) {
    id = json['id'];
    classn = json['classn'];
    subclass = json['subclass'];
    total = json['total'];
    paid = json['paid'];
    due = json['due'];
  }
  String? id;
  String? classn;
  String? subclass;
  num? total;
  num? paid;
  num? due;
ClassModel copyWith({  String? id,
  String? classn,
  String? subclass,
  num? total,
  num? paid,
  num? due,
}) => ClassModel(  id: id ?? this.id,
  classn: classn ?? this.classn,
  subclass: subclass ?? this.subclass,
  total: total ?? this.total,
  paid: paid ?? this.paid,
  due: due ?? this.due,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['classn'] = classn;
    map['subclass'] = subclass;
    map['total'] = total;
    map['paid'] = paid;
    map['due'] = due;
    return map;
  }

}