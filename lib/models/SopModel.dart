// To parse this JSON data, do
//
//     final sopModel = sopModelFromJson(jsonString);

import 'dart:convert';

List<SopModel> sopModelFromJson(String str) => List<SopModel>.from(json.decode(str).map((x) => SopModel.fromJson(x)));

String sopModelToJson(List<SopModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SopModel {
    SopModel({
        this.id,
        this.sop,
        this.sopfor,
        this.updatedAt,
        this.name,
        this.child,
    });

    int id;
    String sop;
    int sopfor;
    DateTime updatedAt;
    String name;
    List<Child> child;

    factory SopModel.fromJson(Map<String, dynamic> json) => SopModel(
        id: json["id"],
        sop: json["sop"],
        sopfor: json["sopfor"],
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        child: List<Child>.from(json["child"].map((x) => Child.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sop": sop,
        "sopfor": sopfor,
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "child": List<dynamic>.from(child.map((x) => x.toJson())),
    };
}

class Child {
    Child({
        this.name,
        this.id,
    });

    String name;
    int id;

    factory Child.fromJson(Map<String, dynamic> json) => Child(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
