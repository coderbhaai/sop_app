import 'package:flutter/material.dart';
// import '../parts/footer.dart';
// import '../parts/appBar.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Page"),
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
