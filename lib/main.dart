import 'package:flutter/material.dart';
import 'package:sop_app/pages/home.dart';
import 'package:sop_app/pages/contact.dart';
import 'package:sop_app/pages/about.dart';
import 'package:sop_app/pages/sop.dart';
import 'package:sop_app/pages/department.dart';

void main() => runApp(
      MaterialApp(initialRoute: '/home', routes: {
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/about': (context) => About(),
        '/contact': (context) => Contact(),
        '/sop': (context) => Sop(),
        '/department': (context) => Department(),
      }),
    );
