class SopModel {
  String deptId;
  String type;
  String department;
  String process;
  String subprocess;
  String time;
  String sop;

  SopModel(
    this.deptId,
    this.type,
    this.department,
    this.process,
    this.subprocess,
    this.time,
    this.sop,
  );
  SopModel.fromJson(Map<String, dynamic> jsonObject) {
    this.deptId = jsonObject['deptId'].toString();
    this.type = jsonObject['type'];
    this.department = jsonObject['department'];
    this.process = jsonObject['process'];
    this.subprocess = jsonObject['subprocess'];
    this.time = jsonObject['time'];
    this.sop = jsonObject['sop'];
  }
}