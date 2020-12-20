import 'package:flutter/material.dart';
import '../parts/footer.dart';
import '../parts/appBar.dart';
import '../parts/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: Sidebar(),
      bottomNavigationBar: BottomBar(),
      body: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Header(), Slider(),
            // BottomBar()
          ],
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  @override
  // Future<http.Response> fetchAlbum() {
  //   return http.get('https://jsonplaceholder.typicode.com/albums/1');
  // }

  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 5.0),
              // decoration: BoxDecoration(color: Colors.amber),
              child: Image(
                  image: AssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover,
                  width: 1000.0),
              // child: Text(
              //   'text $i',
              //   style: TextStyle(fontSize: 16.0),
              // )
            );
          },
        );
      }).toList(),
    );
  }
}
