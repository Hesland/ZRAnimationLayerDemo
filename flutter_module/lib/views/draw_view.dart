import 'package:flutter/material.dart';

class ZRDrawView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:Text('header'.toUpperCase()),
                decoration:BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              UserAccountsDrawerHeader (
                accountName:Text('Michael', style: TextStyle(fontWeight:FontWeight.bold),),
                accountEmail: Text('ioszhaoranwang@foxmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                ),
                decoration:BoxDecoration (
                  color: Colors.yellow[400],
                  image:DecorationImage(
                    image:NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:ColorFilter.mode(Colors.yellow[400].withOpacity(0),
                    BlendMode.hardLight)
                  )
                ),
              ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right,),
                trailing: Icon(Icons.message, color: Colors.black12,size:22.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Favourite', textAlign: TextAlign.right,),
                trailing: Icon(Icons.favorite, color: Colors.black12,size:22.0,),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Settings', textAlign: TextAlign.right,),
                trailing: Icon(Icons.settings, color: Colors.black12,size:22.0,),
                onTap: () => Navigator.pop(context),
              ),
            ]
          )
      );
    }
}