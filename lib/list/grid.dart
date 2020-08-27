import 'package:flutter/material.dart';
import 'package:myapp/res/data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list test',
      home: new Scaffold(
        body: new LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget{

  List<Widget> _getData() {
    List<Widget> list = new List();
    for(var i=0;i<20;i++){
      list.add(
        new Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          color: Colors.blue,
          child:  ListTile(
            title: new Text(
              "Mac $i",
              style: TextStyle(fontSize: 14.0, color: Colors.amber),
            ),
          ),
          alignment: Alignment.center,
        )
      );
    }
    return list;
  }

  List<Widget> _getOutData(){
      var list = data.map((value){
        return new Container(
          child: new Column(
            children: <Widget>[
              Image.network('https://www.itying.com/images/flutter/1.png'),
              Text(value['title'])
            ],
          ),
        );
      });
      return list.toList();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 3,
      childAspectRatio: 1,
      children: this._getOutData(),
    );
    // return GridView.builder(
    //   itemCount: 7,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //   itemBuilder: this._getOutData,
    // );
  }
}