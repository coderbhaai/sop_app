import 'dart:async';
import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sop_app/models/RegModel.dart';
import '../../models/UserModel.dart';
import '../util/app_url.dart';
import '../util/shared_preference.dart';
import 'user_provider.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggingOut,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();
    Response response = await post(
      AppUrl.login,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['data'];
      Dataa authUser = UserModel.fromJson(userData) as Dataa;
      UserPreferences().saveUser(authUser);
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register( String name, String email, String password, String password_confirmation,
      String selectedOrg ) async {
    final Map<String, dynamic> registrationData = {
      'name': name,
      'org': selectedOrg,
      'email': email,
      'role': 'User',
      'status': 0,
      'password': password,
      'password_confirmation': password_confirmation,
    };
    return await post(AppUrl.register, body: json.encode(registrationData),
        headers: {'Content-Type': 'application/json'})
      .then( onValue )
      .catchError(onError);
  }
  Future<void> fetchLoginModel (BuildContext context, String email, String password,
     )async{
    Map bodyr;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };
    var res = await post(AppUrl.login,body: json.encode(loginData), headers: {'Content-Type': 'application/json'});
    if (res.body.isNotEmpty) {
      try {
        bodyr = json.decode(res.body) as Map;
        String Sucess=UserModel.fromJson(bodyr).success.toString();
        UserPreferences().saveUser(UserModel.fromJson(bodyr).data);
        _loggedInStatus = Status.LoggedIn;
        notifyListeners();
        if (Sucess=='true') {
          Dataa user = UserModel.fromJson(bodyr).data;
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          String Message=UserModel.fromJson(bodyr).message.toString();
          Flushbar(
            title: "Failed Login",

            message: Message,
            duration: Duration(seconds: 3),
          ).show(context);
        }
      } on Exception catch (e) {
        print('error caught: $e');
      }
    }
  }

  // login close


  Future<void> fetchRegModel (BuildContext context,String name, String email, String password,
      String password_confirmation,
      String selectedOrg)async{
    Map bodyr;
    final Map<String, dynamic> registrationData = {
      'name': name,
      'org': selectedOrg,
      'email': email,
      'role': 'User',
      'status': 0,
      'password': password,
      'password_confirmation': password_confirmation,
    };
    var res = await post(AppUrl.register,body: json.encode(registrationData), headers: {'Content-Type': 'application/json'});
    if (res.body.isNotEmpty) {
      try {
        bodyr = json.decode(res.body) as Map;
        String Sucess=RegModel.fromJson(bodyr).success.toString();
        if (Sucess=='true') {
          Navigator.pushReplacementNamed(context, '/awaitingApproval');
        } else {
          Flushbar(
            title: "Message",
            message: RegModel.fromJson(bodyr).message.toString(),
            duration: Duration(seconds: 20),
          ).show(context);
        }
      } on Exception catch (e) {
        print('error caught: $e');
      }
    }
    //return RegModel.fromJson(bodyr);
  }


  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 201) {
      var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(userData);

      UserPreferences().saveUser(UserModel.fromJson(userData).data);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

  // md
  Future<bool> logout() async {
    _loggedInStatus = Status.LoggingOut;
    notifyListeners();

    String token = await UserPreferences().getToken(null);

    Response response = await post(AppUrl.logout, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 201) {
      UserPreferences().removeUser();
      _loggedInStatus = Status.LoggedOut;
      notifyListeners();
      return true;
    } else {
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      return false;
    }
  }
}
