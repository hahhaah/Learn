import 'package:flutter/material.dart';
import 'package:myapp/pages/tabs/index.dart';
import 'package:myapp/pages/tabs/mine.dart';
import 'package:myapp/pages/tabs/sport.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Demo',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new BottomNavigationWidget(),
  ));
}



//底部导航栏

class BottomNavigationWidget extends StatefulWidget {
  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationWidget> {

  int _curIndex = 0;

  List _pages = [
    Indexpage(),
    SportPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pages[this._curIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home),title: new Text('首页')),
          BottomNavigationBarItem(icon: new Icon(Icons.business),title: new Text('商业')),
          BottomNavigationBarItem(icon: new Icon(Icons.mood),title: new Text('我的')),
        ],
        currentIndex: _curIndex,
        onTap: (int i){
          setState(() {
            _curIndex = i;
          });
        },
      ),
      
    );
  }
}