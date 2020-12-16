class DataModel {
  String processId;
  String type;
  String process;

  DataModel(
    this.processId,
    this.type,
    this.process,
  );
  DataModel.fromJson(Map<String, dynamic> jsonObject) {
    this.processId = jsonObject['processId'].toString();
    this.type = jsonObject['type'];
    this.process = jsonObject['process'];
  }
}