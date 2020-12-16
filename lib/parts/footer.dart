import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/sop');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/contact');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'SOP',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}

// class AudioWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           IconButton(
//               icon: Icon(Icons.play_arrow),
//               onPressed: () {
//                 print('Go to Home');
//                 Navigator.pushNamed(context, '/home');
//               }),
//           IconButton(
//               icon: Icon(Icons.play_arrow),
//               onPressed: () {
//                 print('Go to About');
//                 Navigator.pushNamed(context, '/about');
//               }),
//           IconButton(
//               icon: Icon(Icons.play_arrow),
//               onPressed: () {
//                 print('Go to Contact');
//                 Navigator.pushNamed(context, '/contact');
//               })
//         ],
//       ),
//     );
//   }
// }
