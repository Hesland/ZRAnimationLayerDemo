import 'package:flutter/material.dart';
import 'views/navigation_view.dart';

void main() {
  runApp(ZRApp());
}

class ZRApp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 关闭 debug 条幅
      home: Home(),
      theme: ThemeData( // 设置风格
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 3,
        child: ZRNavigationView(),
      );
    }
}
