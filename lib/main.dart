import 'package:sop_app/auth/logout.dart';
import 'package:flutter/material.dart';
import 'package:sop_app/pages/home.dart';
import 'package:sop_app/pages/brand.dart';
import 'package:sop_app/pages/awaitingApproval.dart';
import 'package:sop_app/auth/dashboard.dart';
import 'package:sop_app/auth/login.dart';
import 'package:sop_app/auth/register.dart';
import 'package:sop_app/auth/welcome.dart';
import 'auth/logout.dart';
import 'package:sop_app/auth/providers/auth.dart';
import 'package:sop_app/auth/providers/user_provider.dart';
import 'package:sop_app/auth/util/shared_preference.dart';
import 'package:provider/provider.dart';
import 'package:sop_app/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  if(token != null) {
    print("token:" + token);
  }
  else{
    print('token is null');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<UserModel> getUserData() => UserPreferences().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Source Sans Pro'
          ),
          home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                print('home in main ' + snapshot.data.toString());
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (snapshot.data.token == null)
                      return Login();
                    else
                      UserPreferences().removeUser();
                    return Welcome(user: snapshot.data);
                }
              }),
          initialRoute: '/brand',
          routes: {
            '/register': (context) => Register(),
            '/login': (context) => Login(),
            '/dashboard': (context) => DashBoard(),
            '/logout': (context) => Logout(),
            '/home': (context) => Home(),
            '/brand': (context) => Brand(),
            '/awaitingApproval': (context) => AwaitingApproval(),
          }),
    );
  }
}