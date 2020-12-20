import 'package:flutter/material.dart';
import '../parts/footer.dart';
import '../parts/appBar.dart';
import '../parts/drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sop_app/models/DeptListModel.dart';

class DepartmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return deptReive();
  }
}

class deptReive extends StatefulWidget { 
  _MyPass createState() => _MyPass();
}

class _MyPass extends State<deptReive> {
  Future<DeptListModel> futureloinlevel;
  @override
  void initState() {
    futureloinlevel = fetchDeptListModel(1, context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // drawer: Drawer(child:Sidebar()),
      drawer: Sidebar(),
      bottomNavigationBar: BottomBar(),
      body: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Header(), 
            Container( 
              child: FutureBuilder<DeptListModel>(
                future: futureloinlevel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        ListView.builder(
                        physics: NeverScrollableScrollPhysics(), ///
                        shrinkWrap: true, ///
                        scrollDirection: Axis.vertical, ///
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (_, index) =>                  
                          Container (
                            decoration: new BoxDecoration (
                                color: Color.fromRGBO(234, 112, 12, 1),
                                border: Border( bottom: BorderSide( color: Color.fromRGBO(255, 255, 255, 1), width: 2.0 ) )
                            ),
                            child: new ListTile( 
                              title: Text( snapshot.data.data[index].name, textAlign: TextAlign.center, style: TextStyle( color: Colors.white, ), ),
                                onTap: () { Navigator.pushNamed(context, '/sop', arguments: { 'id': snapshot.data.data[index].id.toString(), } ); },
                            ),
                          )
                        )
                      ],
                    );
                  } else if (snapshot.hasError) { return Center( child: Text("${snapshot.error}")); }
                  return ( Center ( child: CircularProgressIndicator(), ));
                })
            ),],
        ),
      ),
    );
  }
  Future<DeptListModel> fetchDeptListModel (int i,BuildContext context)async{
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