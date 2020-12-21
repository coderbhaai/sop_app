import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sop_app/models/DeptListModel.dart';

class Sidebar extends StatefulWidget {
  _MyRegister createState() => _MyRegister();
}

class _MyRegister extends State<Sidebar> {
  Future<DeptListModel> futureloinlevel;

  @override
  void initState() {
    futureloinlevel = fetchDeptListModel();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child:
        FutureBuilder<DeptListModel>(
        future: futureloinlevel,
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Column(
            children: [
            createDrawerHeader(context,snapshot),
            bodyofDrawer(context,snapshot),
          ],
        );
          } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
          }

          return (Center(
          child: CircularProgressIndicator(),
          ));
        }),

    );
  }

  // Widget createDrawerHeader(BuildContext context, AsyncSnapshot<DeptListModel> snapshot) {
  //   return DrawerHeader(
  //     child: Center(child:Text("Header")),);
  // }

  Widget createDrawerHeader(BuildContext context, AsyncSnapshot<DeptListModel> snapshot) {
    return DrawerHeader(
      decoration: BoxDecoration( color: Color.fromRGBO(0,66,96, 1), ),
      child: Center( child : Text( 'Bizz Sutra', textAlign: TextAlign.center, style: TextStyle( color: Color.fromRGBO(234,112,12, 1), fontWeight: FontWeight.bold, fontSize: 25.0 ) ), )
      );
  }

 Widget bodyofDrawer(BuildContext context, AsyncSnapshot<DeptListModel> snapshot) {
    print('bod');
    print(snapshot.data);
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.data.length,
        itemBuilder: (BuildContext context,int index){
          // print(snapshot.data.data[index].name);
          return ListTile(
              title:Text(snapshot.data.data[index].name, style: TextStyle( fontWeight: FontWeight.bold) ),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/sop', arguments: <String, String>{ 'id': snapshot.data.data[index].id.toString() },);
            },
          );
        }
    );

 }


  Future<DeptListModel> fetchDeptListModel ()async{
    print('Calling API');
    Map bodyr;
    var res = await http.get("http://10.0.2.2:8000/api/deptList");
    print(res.toString());
    if (res.statusCode == 200 && res.body.isNotEmpty) {
      bodyr = json.decode(res.body) as Map;
      print(bodyr.toString());
    }
    return DeptListModel.fromJson(bodyr);
  }
}