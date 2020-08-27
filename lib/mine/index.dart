import 'package:flutter/material.dart';
import 'package:myapp/mine/redstar_task.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.grey[100],
    home: Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RedStarTaskWidget(),
        ],
      ),
    );
  }
}
