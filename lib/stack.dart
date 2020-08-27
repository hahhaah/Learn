import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Fonts',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(title: Text('Stack test'),),
        body: new StackTest3(),
      ),
    );
  }
}

class StackTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment(1,1),
      children: <Widget>[
        Text('我是一个文本fgt'),
        new Container(
          width:200.0,
          height:100.0,
          color: Colors.red,
        ),
        Text('我是一个文本dff'),
        Text('我是一个文本sss'),
      ],
    );
  }
}

class StackTest2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      width:200.0,
      height:400.0,
      color: Colors.red,
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment(-1,1),
            child: Icon(Icons.accessibility,size: 40,color: Colors.white,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.dashboard,size: 30,color: Colors.white,),
          ),
           Align(
            alignment: Alignment.bottomLeft,
            child: Icon(Icons.home,size: 40,color: Colors.white,),
          ),
           Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.star,size: 20,color: Colors.green,),
          ), 
        ],
      ),
    );
  }
}

class StackTest3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      width:200.0,
      height:100.0,
      color: Colors.red,
      child: new Stack(
        children: <Widget>[
          Positioned(child: Icon(Icons.star,size: 20,color: Colors.green,),left: 10,),
          Positioned(child: Icon(Icons.dashboard,size: 30,color: Colors.white,),right: 20,),
          Positioned(child: Icon(Icons.search,size: 30,color: Colors.yellow,),left: 10,top: 40,),
          Positioned(child: Icon(Icons.star,size: 20,color: Colors.green,),left: 10,),
        ],
      ),
    );

  }
}