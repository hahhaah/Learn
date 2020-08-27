import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'wode',
    home: new Counter(),
  ));
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print("my button has been tapped!");
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:new Row(
        children: <Widget>[
          RaisedButton(
            onPressed: _increment,
            child: new Text('increment'),
          ),
          Text('countxxx: $_count',
          style: TextStyle(fontSize:10.0 ),),
        ]
      ),
    );
  }
}
