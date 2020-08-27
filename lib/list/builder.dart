import 'package:flutter/material.dart';
import 'package:myapp/res/data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list test',
      home: new Scaffold(
        body: new MyList(),
      ),
    );
  }
}

class MyList extends StatelessWidget {

  List list = new List();
  MyList(){
    for(var i=0;i<20;i++){
    list.add(new Container(
      child:new Column(
        children: [
          ListTile(
            title: new Text(
              "Mac $i",
              style: TextStyle(fontSize: 14.0, color: Colors.pink),
            ),
          ),
          Divider(color: Colors.black,thickness:1.0,indent: 6.0,endIndent: 6.0,)
        ],
      )
    ));
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: this.list.length,
  //     itemBuilder: (context,index){
  //       return this.list[index];
  //     }
  //   );
  // }

  Widget _getOutData(context,index){
      return new ListTile(
        title:Text(data[index]["title"])
      );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: this._getOutData,
    );
  }
}