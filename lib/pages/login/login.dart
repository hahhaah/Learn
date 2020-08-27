import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: AppBar(
        title: Text('登录界面'),
        centerTitle: true,
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(92, 89, 78, 96),
        child: new Column(
          children: <Widget>[
            SizedBox(
              height: 120.0,
            ),
            Text(
              '用户登录',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    //设置四周圆角 角度
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    //设置四周边框
                  ),
                )
              ],
            ),
          ],
        ),
      );
  }
}

class Mytab extends StatefulWidget {
  Mytab({Key key}) : super(key: key);

  @override
  _MytabState createState() => _MytabState();
}

class _MytabState extends State<Mytab> {

  List tabs = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
       child: AppBar(
        title: Text('Sample Code'),
        leading: IconButton(
            icon: Icon(Icons.view_quilt),
            tooltip: 'Air it',
            onPressed: () {},
        ),
        bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
        actions: <Widget>[
            IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: () {},
            ),
            IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'Restitch it',
            onPressed: () {},
            ),
            IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: 'Repair it',
            onPressed: () {},
            )
        ],
      ),
    );
  }
}
