import '../../models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(Dataa user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", user.id.toString());
    prefs.setString("name", user.name);
    prefs.setString("role", user.role);
    prefs.setString("email", user.email);
    prefs.setString('token', user.accessToken);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<Dataa> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = int.parse(prefs.getString("id"));
    String name = prefs.getString("name");
    String role = prefs.getString("role");
    String email = prefs.getString("email");
    String token = prefs.getString("token");
    return Dataa(
        id: id,
        name: name,
        role: role,
        email: email,
        accessToken: token);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.remove("role");
    prefs.remove("email");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
