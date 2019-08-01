import 'package:flutter/material.dart';
import 'package:flutter_module/views/draw_view.dart';
import 'package:flutter_module/views/tabbar_view.dart';
import 'package:flutter_module/views/list_view.dart';

import 'package:flutter_module/attribute_text/text_view.dart';

// class ZRNavigationBar extends StatefulWidget {
//   @override
//     Widget build(BuildContext context) {
//       // TODO: implement build
//       return AppBar(
//           backgroundColor: Colors.grey,
//           title:Text('Navi - Title'),
//           actions: <Widget>[
//             IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Navigation',
//             onPressed: () => debugPrint('search press'),
//           ),
//           ],
//           elevation: 0, // 阴影值
//           bottom: TabBar(
//             unselectedLabelColor: Colors.black38,
//             indicatorColor: Colors.black54,
//             indicatorSize: TabBarIndicatorSize.label,
//             indicatorWeight: 1.0,
//             tabs:<Widget>[
//               Tab(icon:Icon(Icons.local_florist)),
//               Tab(icon:Icon(Icons.change_history)),
//               Tab(icon:Icon(Icons.directions_bike)),
//             ],
//           ),
//         );
//     }
// }

class ZRNavigationView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(// 导航模式
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title:Text('Navi - Title'),
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Navigation',
            onPressed: () => debugPrint('search press'),
          ),
          ],
          elevation: 0, // 阴影值
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs:<Widget>[
              Tab(icon:Icon(Icons.local_florist)),
              Tab(icon:Icon(Icons.change_history)),
              Tab(icon:Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ZRListView(),//Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            ZRTextView(),//Icon(Icons.change_history, size: 128.0, color: Colors.black12,),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12,),
          ],
        ),
        drawer: ZRDrawView(),
        bottomNavigationBar: ZRTabBarView(),
      );
    }
}



