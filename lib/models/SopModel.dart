// To parse this JSON data, do
//
//     final sopModel = sopModelFromJson(jsonString);

import 'dart:convert';

List<SopModel> sopModelFromJson(String str) => List<SopModel>.from(json.decode(str).map((x) => SopModel.fromJson(x)));

String sopModelToJson(List<SopModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SopModel {
    SopModel({
        this.name,
        this.id,
        this.sop,
        this.child,
    });

    String name;
    int id;
    Sop sop;
    List<Child> child;

    factory SopModel.fromJson(Map<String, dynamic> json) => SopModel(
        name: json["name"],
        id: json["id"],
        sop: Sop.fromJson(json["sop"]),
        child: List<Child>.from(json["child"].map((x) => Child.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "sop": sop.toJson(),
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

class Sop {
    Sop({
        this.sop,
        this.updatedAt,
    });

    String sop;
    DateTime updatedAt;

    factory Sop.fromJson(Map<String, dynamic> json) => Sop(
        sop: json["sop"],
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "sop": sop,
        "updated_at": updatedAt.toIso8601String(),
    };
}
