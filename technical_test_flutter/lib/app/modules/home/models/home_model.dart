// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

HomeAllData welcomeFromJson(String str) =>
    HomeAllData.fromJson(json.decode(str));

String welcomeToJson(HomeAllData data) => json.encode(data.toJson());

class HomeAllData {
  bool? success;
  String? message;
  List<ObjHomeData>? data;

  HomeAllData({
    this.success,
    this.message,
    this.data,
  });

  factory HomeAllData.fromJson(Map<String, dynamic> json) => HomeAllData(
        success: json["success"],
        message: json["message"],
        data: List<ObjHomeData>.from(
            json["data"].map((x) => ObjHomeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ObjHomeData {
  int? id;
  String? name;
  int? qty;
  int? price;
  bool? isActive;
  int? maxOrderQty;

  ObjHomeData({
    this.id,
    this.name,
    this.qty,
    this.price,
    this.isActive,
    this.maxOrderQty,
  });

  factory ObjHomeData.fromJson(Map<String, dynamic> json) => ObjHomeData(
        id: json["id"],
        name: json["name"],
        qty: json["qty"],
        price: json["price"],
        isActive: json["is_active"],
        maxOrderQty: json["max_order_qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "qty": qty,
        "price": price,
        "is_active": isActive,
        "max_order_qty": maxOrderQty,
      };
}
