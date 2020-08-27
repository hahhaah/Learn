import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list test',
      home: new Scaffold(
        body: new HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(child: IconContainer(Icons.home,size:40.0,color: Colors.yellow,),flex: 1,),
        Expanded(child: IconContainer(Icons.home,size:40.0,color: Colors.blue,),flex: 2,)
      ],
    );
  }

}

class IconContainer extends StatelessWidget{

  double size;
  Color color;
  IconData icon;

  IconContainer(this.icon,{this.size,this.color}){

  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      height: 100.0,
      width: 100.0,
      child: Center(child: Icon(this.icon,size: this.size,),),
    );
  }

}