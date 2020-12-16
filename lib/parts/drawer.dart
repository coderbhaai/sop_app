import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sop_app/models/drawer.dart';
import '../pages/about.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

Future<List<DrawerModel>> _data() async {
    var res = await http.get("http://10.0.2.2:8000/api/deptList");
    List<DrawerModel> hlist = [];
    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body);
      for (var item in body['data']) {
        DrawerModel home = DrawerModel.fromJson(item);
        hlist.add(home);
      }
    }
    return hlist;
}

class _SidebarState extends State<Sidebar> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DrawerModel>>(
        future: _data(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? DrawerList(list : snapshot.data) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

//ignore: must_be_immutable
class DrawerList extends StatelessWidget {
  List<DrawerModel> list;
  DrawerList({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
            future: _data(),
            builder: (context, snapshot) {
              List<DrawerModel> deptList = snapshot.data;
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: deptList.length,
                  itemBuilder: (_, index) =>
                    ListTile( 
                      title: Text(
                        deptList.elementAt(index).department + ' Id - ' + deptList.elementAt(index).deptId), 
                        onTap: () { 
                          Navigator.pop(context); Navigator.pushNamed(context, '/sop', arguments: <String, String>{'id': deptList.elementAt(index).deptId },); 
                        },
                      ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          ),
      );
  }
}



      // child: DrawerHeader(
      //       decoration: BoxDecoration( color: Colors.blue, ),
      //       child: Text( 'Drawer Header', style: TextStyle( color: Colors.white, fontSize: 24, ), ),
      //     ),
        // child: Container(
        //   color: Theme.of(context).primaryColor,
        //   child: FutureBuilder(
        //     future: _data(),
        //     builder: (context, snapshot) {
        //       List<DrawerModel> deptList = snapshot.data;
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         return ListView.builder(
        //           itemCount: deptList.length,
        //           itemBuilder: (_, index) =>
        //             ListTile(
        //               leading: Icon(Icons.school),
        //               title: Text(deptList.elementAt(index).department + ' ' + deptList.elementAt(index).deptId),
        //             ),
        //         );
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     }
        //   ),
        // ),


    // return Drawer(
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: <Widget>[
    //       DrawerHeader(
    //         decoration: BoxDecoration( color: Colors.blue, ),
    //         child: Text( 'Drawer Header', style: TextStyle( color: Colors.white, fontSize: 24, ), ),
    //       ),
    //       ListTile( leading: Icon(Icons.message), title: Text('Messagess'), ),
    //       ListTile( leading: Icon(Icons.account_circle), title: Text('Profile'), ),
    //       ListTile( leading: Icon(Icons.settings), title: Text('Settings'), ),
    //       GridView.builder(
    //         itemCount: list.length,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //         ),
    //         // itemBuilder: (context, index) {
    //         //   return Department( list
    //         //     // deptId: list[index]['deptId'],
    //         //     // department: list[index]['department'],
    //         //   );
    //         // },

    //         ListView.builder(
    //           itemCount: list.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return Card(
    //               child: Stack(
    //                 children: <Widget>[
    //                   InkWell(
    //                     onTap: () { Navigator.push( context, MaterialPageRoute( builder: (context) => About())); },
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(16),
    //                       child: Text( list[index].department ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         )
    //       ),          
    //     ]
    //   )
    // );


// class Department extends StatelessWidget {
//   Department(list);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: name,
//         child: Material(
//           child: InkWell(
//             onTap: () {},
//             child: GridTile(
//               footer: Container(
//                 color: Colors.white,
//                 child: ListTile(
//                   leading: Text(
//                     name,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
      
      // ListView(
      //   padding: EdgeInsets.zero,
      //   children: <Widget>[
      //     new SizedBox(
      //       height: 100.0,
      //       child: new DrawerHeader(
      //         child: Text( 'Biz Sutra', textAlign: TextAlign.center, style: TextStyle( color: Colors.red, ), ),
      //         decoration: BoxDecoration( color: Colors.blue, ),
      //       ),
      //     ),
          
         
      //   ],
      // ),



// return (
    //     ListTile( title: Text('Home'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/home'); }, ),
    //     ListTile( title: Text('About'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/about'); }, ),
    //     ListTile( title: Text('Contact'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/contact'); }, ),
    // );
    // return ListView(
    //   padding: const EdgeInsets.all(8),
    //   children: <Widget>[
    //     Container( height: 50, color: Colors.amber[600], child: const Center(child: Text('Entry A')), ),
    //     Container( height: 50, color: Colors.amber[500], child: const Center(child: Text('Entry B')), ),
    //     Container( height: 50, color: Colors.amber[100], child: const Center(child: Text('Entry C')), ),
    //   ],
    // );


// return Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: <Widget>[
//       new SizedBox(
//         height: 100.0,
//         child: new DrawerHeader(
//           child: Text( 'Biz Sutra', textAlign: TextAlign.center, style: TextStyle( color: Colors.red, ), ),
//           decoration: BoxDecoration( color: Colors.blue, ),
//         ),
//       ),
//       DrawerList()
//     ],
//   ),
// );

// return Drawer(
//       // child: new DrawerHeader(
//       //         child: Text( 'Biz Sutra', textAlign: TextAlign.center, style: TextStyle( color: Colors.red, ), ),
//       //         decoration: BoxDecoration( color: Colors.blue ),
//       //       ),
//       // child: ListView(
//       //   padding: EdgeInsets.zero,
//       //   children: <Widget>[
//       //     new SizedBox(
//       //       height: 100.0,
//       //       child: new DrawerHeader(
//       //         child: Text( 'Biz Sutra', textAlign: TextAlign.center, style: TextStyle( color: Colors.red, ), ),
//       //         decoration: BoxDecoration( color: Colors.blue, ),
//       //       ),
//       //     ),
//       //   ]
//       // ),
    //   child: ListView.builder(
    //       itemCount: list.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Card(
    //           child: Stack(
    //             children: <Widget>[
    //               InkWell(
    //                 onTap: () { Navigator.push( context, MaterialPageRoute( builder: (context) => About())); },
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(16),
    //                   child: Text( list[index].department ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     )
    // );


//     class HomeView extends StatefulWidget {
//   HomeView({Key key}): super(key: key);

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Container(
//           color: Theme.of(context).primaryColor,
//           child: FutureBuilder(
//             future: DBHelper.dbHelper.getAllCourses(),
//             builder: (context, snapshot) {
//               List<Course> coursesList = snapshot.data;
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return ListView.builder(
//                   itemCount: coursesList.length,
//                   itemBuilder: (_, index) =>
//                     ListTile(
//                       leading: Icon(Icons.school),
//                       title: Text(coursesList.elementAt(index).subject + ' ' + coursesList.elementAt(index).name),
//                     ),
//                 );
//               } else {
//                 return CircularProgressIndicator();
//               }
//             }
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         title: Text('MyApp View Prototypes'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Center(
//               child: Text('click on the hamburger menu to open the drawer')
//           ),
//         ],
//       ),
//     );
//   }