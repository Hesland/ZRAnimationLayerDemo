import 'package:flutter/material.dart';

class ZRTextView extends StatelessWidget {
  
  @override
    Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child:Icon(Icons.pool, size:32.0, color: Colors.white,),
              padding:EdgeInsets.all(16.0),
              margin:EdgeInsets.all(8.0),
              width: 120,
              height:90,
              decoration: BoxDecoration(
                color:Color.fromRGBO(3, 255, 241, 0.6),
                border: Border.all(
                  color: Colors.black,
                  style:BorderStyle.solid,
                  width:5,
                ),
                // borderRadius: BorderRadius.circular(15),
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(30),
                  bottomRight:Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                  offset:Offset(30.0, 7.0), // 阴影的偏移量（x,y）
                  color:Colors.red,
                  blurRadius:1.0, // 阴影的模糊程度
                  spreadRadius: -10.0, // 阴影的扩散程度
                  ),
                ],
                shape: BoxShape.rectangle, //BoxShape.circle,// 不能与圆角效果共存
                gradient: RadialGradient(
                  colors:[
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                  ],
                  
                )
              ),
            ),
          ],
        ),
      );
    }
}

class ZRRichText extends StatelessWidget {
  final String _title = '自定义字符串：';
  final TextStyle _style = TextStyle (
    fontSize: 30,
    color: Colors.purple,
    fontWeight: FontWeight.w300,
  );
  @override
    Widget build(BuildContext context) {
      return RichText(
        text: TextSpan(
          text:'$_title 我是一段文字',
          style: _style,
          children: [
            TextSpan(
              text:'另外一段文字',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.w200,
              )
            ),
          ]
        ),
        
      );
    }
}