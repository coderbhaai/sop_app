import 'package:flutter/material.dart';
import 'package:sop_app/auth/register.dart';
import 'package:sop_app/auth/login.dart';
import 'package:sop_app/pages/home.dart';
import 'package:sop_app/pages/sop.dart';
import 'package:sop_app/pages/departmentList.dart';
import 'package:sop_app/auth/welcome.dart';
import 'package:sop_app/auth/logout.dart';
import 'auth/dashboard.dart';

void main() => runApp(
      MaterialApp(initialRoute: '/home', routes: {
        '/register': (context) => Register(),
        '/login': (context) => Login(),
        '/dashboard': (context) => DashBoard(),
        '/logout': (context) => Logout(),
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/sop': (context) => Sop(),
        '/departmentList': (context) => DepartmentList(),

      }),
    );
