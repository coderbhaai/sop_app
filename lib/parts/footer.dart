import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() { _selectedIndex = index; });
    if (index == 0) { Navigator.pushNamed(context, '/home'); }
    else if (index == 1) { Navigator.pushNamed(context, '/departmentList'); }
    else if (index == 2) { Navigator.pushNamed(context, '/register'); }
    else if (index == 3) { Navigator.pushNamed(context, '/login'); }
    print('_selectedIndex');
    print(_selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(0,66,96, 1),
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem( icon: Icon(Icons.home, color: _selectedIndex == 0 ? Color.fromRGBO(234,112,12, 1) : Color.fromRGBO(0,66,96, 1) ), label: 'Home'),
        BottomNavigationBarItem( icon: Icon(Icons.business, color: _selectedIndex == 1 ? Color.fromRGBO(234,112,12, 1) : Color.fromRGBO(0,66,96, 1)), label: 'SOP'),
        BottomNavigationBarItem( icon: Icon(Icons.business, color: _selectedIndex == 2 ? Color.fromRGBO(234,112,12, 1) : Color.fromRGBO(0,66,96, 1)), label: 'Register'),
        BottomNavigationBarItem( icon: Icon(Icons.business, color: _selectedIndex == 3 ? Color.fromRGBO(234,112,12, 1) : Color.fromRGBO(0,66,96, 1)), label: 'Login'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromRGBO(234,112,12, 1),
      unselectedItemColor: Color.fromRGBO(0,66,96, 1),
      onTap: _onItemTapped,
    );
  }
}