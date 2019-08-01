import 'package:flutter/material.dart';

class ZRTabBarView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return ZRTabBarViewDemo();
    }
}

class ZRTabBarViewDemo extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return ZRTabBarViewDemoState();
    }
}

class ZRTabBarViewDemoState extends State<ZRTabBarViewDemo> {
  int _currentIndex = 0;

  void _onTapHandler (int index) { // type binding
    setState(() {
          _currentIndex = index;
        });
  }
  @override
    Widget build(BuildContext context) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          fixedColor: Colors.purple,
          currentIndex: _currentIndex,
          onTap: _onTapHandler,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title:Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title:Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title:Text('List'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title:Text('My'),
            ),
            ],
      );
    }
}