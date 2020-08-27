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
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: null)
          ],

        ),
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

  List list = new List();

  void handlePress(){
    setState(() {
      this.list.add('how are hdishiuashu');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new RaisedButton(
          child: Text('button'),
          onPressed: handlePress,
        ),
        new Column(
          children: this.list.map((value){
            return new ListTile(title:Text(value));
          }).toList(),
        ),
        new SizedBox(height: 20.0,),
      ],
    );
  }
}