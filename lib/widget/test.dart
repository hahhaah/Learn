import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Flutter demo'),
        ),
        body: new HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cnt = 0;

  void handlepress(){
    setState(() {
      _cnt++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Row(children: <Widget>[
         Text('${this._cnt}'),
         RaisedButton(onPressed: handlepress,),
       ],),
    );
  }
}
