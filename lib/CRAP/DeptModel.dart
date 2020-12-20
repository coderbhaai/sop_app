// To parse this JSON data, do
//
//     final deptModel = deptModelFromJson(jsonString);

import 'dart:convert';

DeptModel deptModelFromJson(String str) => DeptModel.fromJson(json.decode(str));

String deptModelToJson(DeptModel data) => json.encode(data.toJson());

class DeptModel {
    DeptModel({
        this.data,
    });

    Data data;

    factory DeptModel.fromJson(Map<String, dynamic> json) => DeptModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.deptId,
        this.type,
        this.department,
        this.basicTime,
        this.sop,
        this.process,
    });

    int deptId;
    String type;
    String department;
    DateTime basicTime;
    Sop sop;
    List<Process> process;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        deptId: json["deptId"],
        type: json["type"],
        department: json["department"],
        basicTime: DateTime.parse(json["basicTime"]),
        sop: Sop.fromJson(json["sop"]),
        process: List<Process>.from(json["process"].map((x) => Process.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "deptId": deptId,
        "type": type,
        "department": department,
        "basicTime": basicTime.toIso8601String(),
        "sop": sop.toJson(),
        "process": List<dynamic>.from(process.map((x) => x.toJson())),
    };
}

class Process {
    Process({
        this.processId,
        this.type,
        this.process,
    });

    int processId;
    String type;
    String process;

    factory Process.fromJson(Map<String, dynamic> json) => Process(
        processId: json["processId"],
        type: json["type"],
        process: json["process"],
    );

    Map<String, dynamic> toJson() => {
        "processId": processId,
        "type": type,
        "process": process,
    };
}

class Sop {
    Sop({
        this.sopData,
        this.sopUpdatedAt,
    });

    String sopData;
    DateTime sopUpdatedAt;

    factory Sop.fromJson(Map<String, dynamic> json) => Sop(
        sopData: json["sopData"],
        sopUpdatedAt: DateTime.parse(json["sopUpdatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "sopData": sopData,
        "sopUpdatedAt": sopUpdatedAt.toIso8601String(),
    };
}
