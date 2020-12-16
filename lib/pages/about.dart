import 'package:flutter/material.dart';
// import '../parts/footer.dart';
// import '../parts/appBar.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Page"),
          elevation: 0.0,
        ),
        body: Container(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[],
          ),
        ));
  }
}
