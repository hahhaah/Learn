import 'package:flutter/material.dart';


class Indexpage extends StatefulWidget {
  Indexpage({Key key}) : super(key: key);

  @override
  _IndexpageState createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Container(
      width: 70.0,
      height: 80.0,
      child: new RaisedButton(
        color: Colors.cyan,
        child: Text('跳转至其他页面'),
        onPressed: (){
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (BuildContext context){
        //     return SportPage();
        //   })
        // );
        Navigator.pushNamed(context, '/sport');
      }),
    )),
    );
  }
}