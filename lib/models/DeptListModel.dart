// To parse this JSON data, do
//
//     final deptListModel = deptListModelFromJson(jsonString);

import 'dart:convert';

DeptListModel deptListModelFromJson(String str) => DeptListModel.fromJson(json.decode(str));

String deptListModelToJson(DeptListModel data) => json.encode(data.toJson());

class DeptListModel {
    DeptListModel({
        this.data,
    });

    List<Datum> data;

    factory DeptListModel.fromJson(Map<String, dynamic> json) => DeptListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.name,
        this.id,
    });

    String name;
    int id;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
