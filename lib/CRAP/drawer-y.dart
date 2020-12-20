// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:sop_app/models/drawer.dart';
// import '../pages/about.dart';

// class Sidebar extends StatefulWidget {
//   @override
//   _SidebarState createState() => _SidebarState();
// }

// Future<List<DrawerModel>> _data() async {
//     var res = await http.get("http://click2learn.co.in/api/deptList-p");
//     print('testing');
//     List<DrawerModel> hlist = [];
//     if (res.statusCode == 200) {
//       Map<String, dynamic> body = json.decode(res.body);
//       for (var item in body['data']) {
//         DrawerModel home = DrawerModel.fromJson(item);
//         hlist.add(home);
//       }
//     }
//     return hlist;
// }

// class _SidebarState extends State<Sidebar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   appBar: AppBar(
//     title: const Text('Drawer Demo'),
//   ),
//   drawer: Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: const <Widget>[
//         DrawerHeader(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//           ),
//           child: Text( 'Drawer Header', style: TextStyle( color: Colors.white, fontSize: 24, ), ),
//         ),
//         child: FutureBuilder(
//             future: _data(),
//             builder: (context, snapshot) {
//               List<DrawerModel> deptList = snapshot.data;
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return ListView.builder(
//                   itemCount: deptList.length,
//                   itemBuilder: (_, index) =>
//                     ListTile(
//                       leading: Icon(Icons.school),
//                       title: Text(deptList.elementAt(index).department + ' ' + deptList.elementAt(index).deptId),
//                     ),
//                 );
//               } else {
//                 return CircularProgressIndicator();
//               }
//             }
//           ),
//       ],
//     ),
//   ),
// );
//   }
// }




//         // ListTile(
//         //   leading: Icon(Icons.message),
//         //   title: Text('Messages'),
//         // ),
//         // ListTile(
//         //   leading: Icon(Icons.account_circle),
//         //   title: Text('Profile'),
//         // ),
//         // ListTile(
//         //   leading: Icon(Icons.settings),
//         //   title: Text('Settings'),
//         // ),
      