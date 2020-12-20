// To parse this JSON data, do
//
//     final subProcessModel = subProcessModelFromJson(jsonString);

import 'dart:convert';

SubProcessModel subProcessModelFromJson(String str) => SubProcessModel.fromJson(json.decode(str));

String subProcessModelToJson(SubProcessModel data) => json.encode(data.toJson());

class SubProcessModel {
    SubProcessModel({
        this.data,
    });

    Data data;

    factory SubProcessModel.fromJson(Map<String, dynamic> json) => SubProcessModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.subprocessId,
        this.type,
        this.tab1,
        this.subprocess,
        this.basicTime,
        this.dept,
        this.process,
        this.sop,
        this.superprocess,
    });

    int subprocessId;
    String type;
    String tab1;
    String subprocess;
    DateTime basicTime;
    Dept dept;
    Process process;
    Sop sop;
    List<Superprocess> superprocess;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        subprocessId: json["subprocessId"],
        type: json["type"],
        tab1: json["tab1"],
        subprocess: json["subprocess"],
        basicTime: DateTime.parse(json["basicTime"]),
        dept: Dept.fromJson(json["dept"]),
        process: Process.fromJson(json["process"]),
        sop: Sop.fromJson(json["sop"]),
        superprocess: List<Superprocess>.from(json["superprocess"].map((x) => Superprocess.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subprocessId": subprocessId,
        "type": type,
        "tab1": tab1,
        "subprocess": subprocess,
        "basicTime": basicTime.toIso8601String(),
        "dept": dept.toJson(),
        "process": process.toJson(),
        "sop": sop.toJson(),
        "superprocess": List<dynamic>.from(superprocess.map((x) => x.toJson())),
    };
}

class Dept {
    Dept({
        this.deptId,
        this.type,
        this.dept,
    });

    int deptId;
    String type;
    String dept;

    factory Dept.fromJson(Map<String, dynamic> json) => Dept(
        deptId: json["deptId"],
        type: json["type"],
        dept: json["dept"],
    );

    Map<String, dynamic> toJson() => {
        "deptId": deptId,
        "type": type,
        "dept": dept,
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

class Superprocess {
    Superprocess({
        this.superprocessId,
        this.type,
        this.superprocess,
    });

    int superprocessId;
    String type;
    String superprocess;

    factory Superprocess.fromJson(Map<String, dynamic> json) => Superprocess(
        superprocessId: json["superprocessId"],
        type: json["type"],
        superprocess: json["superprocess"],
    );

    Map<String, dynamic> toJson() => {
        "superprocessId": superprocessId,
        "type": type,
        "superprocess": superprocess,
    };
}
