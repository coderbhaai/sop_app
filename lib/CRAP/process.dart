import 'package:flutter/material.dart';
import '../parts/footer.dart';
import '../parts/appBar.dart';
import '../parts/drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sop_app/CRAP/ProcessModel.dart';


class Process extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return deptReive();
  }
}

class deptReive extends StatefulWidget { 
  _MyPass createState() => _MyPass();
}

class _MyPass extends State<deptReive> {
  Future<ProcessModel> futureloinlevel;
  @override
  void initState() {
    futureloinlevel = fetchProcessModel(1, context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: Sidebar(),
      body: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Header(), 
            Container( 
              // child: Text('hi'),
              child: FutureBuilder<ProcessModel>(
                future: futureloinlevel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          child: Text( snapshot.data.data.process+' Process', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only( top: 40, bottom: 20 ), 
                            child: Text('Sop for '+snapshot.data.data.process, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),)
                            )
                        ),
                        Container (
                           child: ListTile( title: Text(snapshot.data.data.sop.sopData, textAlign: TextAlign.justify ) ),
                        ),
                        Container (
                            child: ListTile( title: Text('List of Sub Processes', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),) ),
                        ),
                        ListView.builder(
                        physics: NeverScrollableScrollPhysics(), ///
                        shrinkWrap: true, ///
                        scrollDirection: Axis.vertical, ///
                          itemCount: snapshot.data.data.process.length,
                          itemBuilder: (_, index) =>                  
                          Container (
                            decoration: new BoxDecoration (
                                color: Color.fromRGBO(234, 112, 12, 1),
                                border: Border( bottom: BorderSide( color: Color.fromRGBO(255, 255, 255, 1), width: 2.0 ) )
                            ),
                            child: new ListTile( 
                              title: Text( snapshot.data.data.subprocess[index].subprocess, textAlign: TextAlign.center, style: TextStyle( color: Colors.white, ), ),
                                onTap: () { 
                                  // Navigator.pop(context); 
                                  Navigator.pushNamed(context, '/subprocess', arguments: <String, String>{ 'id': snapshot.data.data.subprocess[index].subprocessId.toString() },); 
                                },
                            ),
                          )
                        )
                      ],
                    );
                  } else if (snapshot.hasError) { return Center( child: Text("${snapshot.error}")); }
                  return ( Center ( child: CircularProgressIndicator(), ));
                })
            ),
           BottomBar()],
        ),
      ),
    );
  }
  
  Future<ProcessModel> fetchProcessModel (int i,BuildContext context)async{
    Map bodyr;
    var res = await http.get("http://10.0.2.2:8000/api/fetchProcess/5");
    print(res.toString());
    if (res.statusCode == 200 && res.body.isNotEmpty) {
      bodyr = json.decode(res.body) as Map;
      print(bodyr.toString());
    }
    return ProcessModel.fromJson(bodyr);
  }  
}