import 'package:flutter/material.dart';
import '../parts/footer.dart';
import '../parts/appBar.dart';
import '../parts/drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:sop_app/models/sop.dart';
import 'package:sop_app/models/basic.dart';
import 'package:sop_app/models/data.dart';

class Sop extends StatefulWidget {
  @override
  _SopState createState() => _SopState();
}

Future<List<DataModel>> _data() async {
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  // if (arguments != null){ print(arguments['id']); }else{ print('No Arguments'); }
    var res = await http.get("http://10.0.2.2:8000/api/getSopDetails/dept/1");
    List<DataModel> data1 = [];
    if (res.statusCode == 200 && res.body.isNotEmpty) {
      Map<dynamic, dynamic> body = json.decode(res.body);
      // BasicModel basic = body['basic'].fromJson();
      for (var item in body['data']) { DataModel home = DataModel.fromJson(item); data1.add(home); }
    }
    return data1 ;
}

class _SopState extends State<Sop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: Sidebar(),
      body: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Header(), SopDetails(), BottomBar()],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class SopDetails extends StatelessWidget {
  // List<DataModel>list;
  // SopDetails({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<DataModel>>(
        future: _data(),
        builder: (context, snapshot) {
          List<DataModel>sopList = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Container(

                ),
                Container (
                    decoration: new BoxDecoration ( 
                      color: Colors.red,
                    ),
                    child: ListTile( title: Text('List of processes', textAlign: TextAlign.center,) ),
                ),
                ListView.builder(
                physics: NeverScrollableScrollPhysics(), ///
                shrinkWrap: true, ///
                scrollDirection: Axis.vertical, ///
                  itemCount: sopList.length,
                  itemBuilder: (_, index) =>
                  
                  Container (
                    decoration: new BoxDecoration (
                        color: Colors.orangeAccent,
                        border: Border( bottom: BorderSide( color: Color.fromRGBO(255, 255, 255, 1), width: 2.0 ) )
                    ),
                    child: new ListTile( 
                      title: Text(sopList[index].process, textAlign: TextAlign.center, style: TextStyle( color: Colors.white, ),), 
                        onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/sop', arguments: <String, String>{'id': sopList[index].processId },); },
                      ),
                  )
                  // itemBuilder: (BuildContext context, int index) => Card(
                  //       child: Column(
                  //         children:[ Text(sopList[index].process) ],
                  //       ),
                  //     ),
                )
              ],
            );
            
          }else{ return Text('Hi'); }
        }
      )
    );
  }
}






// // print(snapshot.data);
//             // return Text('Hi');
//             return 
//             // Expanded(
//             //   child: Container(
//                 Column(
//                   children: <Widget>[
//                     Text('Deliver features faster'),
//                     Text('Craft beautiful UIs'),
//                     ListView.builder(
//                           itemCount: sopList.length,
//                           itemBuilder: (BuildContext ctxt, int index) {
//                             return Column(
//                               children: [ Text(sopList[index].process) ]
//                             );
//                           }
//                       ),
//                 ],
//                 // Expanded(
//                       // child: Container(
//                     //     children: <Widget>[
//                     //     child: ListView.builder(
//                     //       itemCount: sopList.length,
//                     //       itemBuilder: (BuildContext ctxt, int index) {
//                     //         return Column(
//                     //           children: [ Text(sopList[index].process) ]
//                     //         );
//                     //       }
//                     //   ),
//                     // )
//                   // )
//                 // );
//               );
//             // );
















// return Expanded(
//               child: Container(
//                 child: ListView.builder(
//                     itemCount: sopList.length,
//                     itemBuilder: (BuildContext ctxt, int index) {
//                       return Column(
//                         children: [ Text(sopList[index].process) ]
//                       );
//                     }
//                 ),
//               ),
//             );

                  //   children: <Widget>[ 
                    
                  //   Text(this.name, style: TextStyle(fontWeight: 
                  //       FontWeight.bold)), Text(this.description), 
                  //   Text("Price: " + this.price.toString()), 
                  // ], 
                // );
                // return ListView.builder(
                //   itemCount: sopList.length,
                //   itemBuilder: (_, index) =>
                //     ListTile( 
                //       title: Text(
                //         sopList.elementAt(index).department + ' Id - ' + sopList.elementAt(index).deptId), 
                //         onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/sop', arguments: <String, String>{'id': sopList.elementAt(index).deptId },); },
                //       ),
                // );
              //   return Container(
              //   Expanded(
              //     child: ListView.builder(
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           Text( 'hi' ),
              //         );
              //       },
              //       itemCount: sopList.length,
              //     ),
              //   )
              // } else {
              //   return CircularProgressIndicator();
              // }
              //   )