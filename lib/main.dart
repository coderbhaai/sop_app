import 'package:sop_app/auth/logout.dart';
import 'package:flutter/material.dart';
import 'package:sop_app/pages/departmentList.dart';
import 'package:sop_app/pages/sop.dart';
import 'package:sop_app/pages/home.dart';
import 'package:sop_app/pages/brand.dart';
import 'package:sop_app/pages/awaitingApproval.dart';
import 'package:sop_app/auth/login.dart';
import 'package:sop_app/auth/register.dart';
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
  String token = prefs.getString("userToken");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Data> getUserData() => UserPreferences().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'PSP_App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Source Sans Pro'
          ),
          initialRoute: '/brand',
          routes: {
            '/home': (context) => Home(),
            '/register': (context) => Register(),
            '/login': (context) => Login(),
            '/logout': (context) => Logout(),
            '/brand': (context) => Brand(),
            '/awaitingApproval': (context) => AwaitingApproval(),
            '/departmentList': (context) => DepartmentList(),
            '/sop': (context) => Sop(),
          }),
    );
  }
}