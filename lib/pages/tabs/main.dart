import 'package:flutter/material.dart';
import 'package:myapp/pages/tabs/mine.dart';
import 'package:myapp/pages/tabs/sport.dart';
import 'package:myapp/widget/tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final routes = {
    '/sport':(context)=>SportPage(),
    '/mine':(context)=>MinePage(),
  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      //接受map类型参数
      routes: {
        '/sport':(context)=>SportPage(),
        '/mine':(context)=>MinePage(),
      },
      home: new BottomNavigationWidget(),
      // onGenerateRoute: ,
    );
  }
}