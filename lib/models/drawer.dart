class DrawerModel {
  String deptId;
  String type;
  String department;

  DrawerModel(
    this.deptId,
    this.type,
    this.department,
  );
  DrawerModel.fromJson(Map<String, dynamic> jsonObject) {
    this.deptId = jsonObject['deptId'].toString();
    this.type = jsonObject['type'];
    this.department = jsonObject['department'];
  }
}
