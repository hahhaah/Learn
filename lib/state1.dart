import 'package:flutter/material.dart';

//widget管理自己的状态
/*
_TapboxAState 类:

管理TapboxA的状态.
定义_isActive：确定盒子的当前颜色的布尔值.
定义_handleTap()函数，该函数在点击该盒子时更新_active,并调用setState()更新UI.
实现widget的所有交互式行为.
*/
void main(){
  runApp(new MyApp());
}

  
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'demo',
      home: new Scaffold(
        appBar: new AppBar(title:new Text('flutter demo')),
        body: new Center(
          child:new TapBoxA(),
        ),
      ),);
  }
}

class TapBoxA extends StatefulWidget{
  @override
  _TapBoxAState createState() => new _TapBoxAState();
  
}

class _TapBoxAState extends State<TapBoxA>{

  bool _isActive = false;

  void handleTap(){
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        width: 150.0,
        height: 100.0,
        child:new Center(child: new Text(
          _isActive?'active':'Inactive',
          style: new TextStyle(fontSize: 32.0, color: Colors.white),
        ),),
        decoration: new BoxDecoration(
          color: _isActive?Colors.green:Colors.black54,
        ),
      ),
    );
  }  
  
}