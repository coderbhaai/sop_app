import 'package:flutter/material.dart';
import '../parts/footer.dart';
import '../parts/appBar.dart';
import '../parts/drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:sop_app/models/sop.dart';
import 'package:sop_app/models/basic.dart';

class Sop extends StatefulWidget {
  @override
  _SopState createState() => _SopState();
}

Future<List<BasicModel>> _data() async {
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  // if (arguments != null){ print(arguments['id']); }else{ print('No Arguments'); }
    var res = await http.get("http://10.0.2.2:8000/api/getSopDetails/dept/1");
    List<BasicModel> data1 = [];
    if (res.statusCode == 200 && res.body.isNotEmpty) {
      Map<dynamic, dynamic> body = json.decode(res.body);
      print('body');
      print(body['data']);
      for (var item in body['data']) { BasicModel home = BasicModel.fromJson(item); data1.add(home); }
    }
    return  data1 ;
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
  List<BasicModel>list;
  SopDetails({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<BasicModel>>(
        future: _data(),
        builder: (context, snapshot) {
              List<BasicModel>sopList = snapshot.data;
              if (snapshot.connectionState == ConnectionState.done) {
                // print(snapshot.data);
                return Text('Hi');
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
            }
        }
      )
    );
  }
}