import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: RouterTestRoute(),));

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: RaisedButton(
        child: Text('click to jump'),
        onPressed: () async {
          var result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context){
              return TipRoute(text: "我是参数11111",);
            }),
          );
          showDialog(
            context: context,
            builder: (context)=>AlertDialog(title: new Text('$result'),),
          );
        },
      ),
    );
  }
}

class TipRoute extends StatelessWidget {

  TipRoute({Key key,@required this.text,}):super(key:key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(children: <Widget>[
            Text(text),
            FlatButton(
              onPressed: ()=> Navigator.pop(context,"我是返回值"),
              child: Text("back"),
            )
          ],),
        ),
      ), 
    );
  }
}