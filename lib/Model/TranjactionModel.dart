class TranjactionModel {
  TranjactionModel({
      this.id, 
      this.recieve, 
      this.send,
      this.datetime, 
      this.des,});

  TranjactionModel.fromJson(dynamic json) {
    id = json['id'];
    recieve = json['recieve'];
    send = json['send'];
    datetime = json['datetime'];
    des = json['des'];
  }
  String? id;
  String? recieve;
  String? send;
  String? datetime;
  String? des;
TranjactionModel copyWith({  String? id,
  String? recieve,
  String? send,
  String? datetime,
  String? des,
}) => TranjactionModel(  id: id ?? this.id,
  recieve: recieve ?? this.recieve,
  send: send ?? this.send,
  datetime: datetime ?? this.datetime,
  des: des ?? this.des,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['recieve'] = recieve;
    map['send'] = send;
    map['datetime'] = datetime;
    map['des'] = des;
    return map;
  }

}