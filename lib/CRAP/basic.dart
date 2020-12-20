class BasicModel {
  String deptId;
  String type;
  String department;
  String basicTime;
  String sop;

  BasicModel(
    this.deptId,
    this.type,
    this.department,
    this.basicTime,
    this.sop,
  );

  BasicModel.fromJson(Map<String, dynamic> jsonObject) {
    this.deptId         = jsonObject['deptId'].toString();
    this.type           = jsonObject['type'].toString();
    this.department     = jsonObject['department'].toString();
    this.basicTime      = jsonObject['basicTime'];
    this.sop            = jsonObject['sop'];
  }
}