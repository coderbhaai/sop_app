class UserModel {
  String id;
  String name;
  String email;
  String role;
  String token;

  UserModel({this.id, this.name, this.email, this.role, this.token});

  UserModel.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'].toString();
    this.name = jsonObject['name'];
    this.email = jsonObject['email'];
    this.role = jsonObject['role'];
    this.token = jsonObject['token'];
  }
}