// To parse this JSON data, do
//
//     final processModel = processModelFromJson(jsonString);

import 'dart:convert';

ProcessModel processModelFromJson(String str) => ProcessModel.fromJson(json.decode(str));

String processModelToJson(ProcessModel data) => json.encode(data.toJson());

class ProcessModel {
    ProcessModel({
        this.data,
    });

    Data data;

    factory ProcessModel.fromJson(Map<String, dynamic> json) => ProcessModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.processId,
        this.type,
        this.tab1,
        this.process,
        this.basicTime,
        this.sop,
        this.subprocess,
    });

    int processId;
    String type;
    String tab1;
    String process;
    DateTime basicTime;
    Sop sop;
    List<Subprocess> subprocess;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        processId: json["processId"],
        type: json["type"],
        tab1: json["tab1"],
        process: json["process"],
        basicTime: DateTime.parse(json["basicTime"]),
        sop: Sop.fromJson(json["sop"]),
        subprocess: List<Subprocess>.from(json["subprocess"].map((x) => Subprocess.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "processId": processId,
        "type": type,
        "tab1": tab1,
        "process": process,
        "basicTime": basicTime.toIso8601String(),
        "sop": sop.toJson(),
        "subprocess": List<dynamic>.from(subprocess.map((x) => x.toJson())),
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

class Subprocess {
    Subprocess({
        this.subprocessId,
        this.type,
        this.subprocess,
    });

    int subprocessId;
    String type;
    String subprocess;

    factory Subprocess.fromJson(Map<String, dynamic> json) => Subprocess(
        subprocessId: json["subprocessId"],
        type: json["type"],
        subprocess: json["subprocess"],
    );

    Map<String, dynamic> toJson() => {
        "subprocessId": subprocessId,
        "type": type,
        "subprocess": subprocess,
    };
}
