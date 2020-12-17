import 'package:flutter/material.dart';
import 'package:sop_app/models/DeptMtype.dart';
import 'package:sop_app/models/DeptMtype.dart';
import 'package:sop_app/models/DeptMtype.dart';
import 'package:sop_app/models/DeptMtype.dart';
import '../parts/footer.dart';
import '../parts/appBar.dart';
import '../parts/drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sop_app/models/DeptMtype.dart';

class Department extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return deptReive();
  }
}

class deptReive extends StatefulWidget {
  _MyPass createState() => _MyPass();
}
class _MyPass extends State<deptReive> {
  Future<DeptMtype> futureloinlevel;
  @override
  void initState() {
    futureloinlevel = fetchDeptMtype(1, context);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DeptMtype>(
        future: futureloinlevel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.data.department);
          } else if (snapshot.hasError) {
            return Center(
                child: Text("${snapshot.error}"));
          }
          return (Center(
            child: CircularProgressIndicator(),
          ));
        });
  }

  Future<DeptMtype> fetchDeptMtype (int i,BuildContext context)async{
    Map bodyr;
    var res = await http.get("http://10.0.2.2:8000/api/fetchDepartment/1");
    print(res.toString());
    if (res.statusCode == 200 && res.body.isNotEmpty) {
      bodyr = json.decode(res.body) as Map;
      print(bodyr.toString());
    }
    return DeptMtype.fromJson(bodyr);
  }
}

