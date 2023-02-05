import 'data.dart';

class Pokemon {
  bool? op;
  String? msg;
  List<Data>? data;

  Pokemon({this.op, this.msg, this.data});

  Pokemon.fromJson(Map<String, dynamic> json) {
    op = json['op'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['op'] = op;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
