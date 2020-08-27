import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: RouterTestRoute(),));

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: RaisedButton(
        child: Text('click to jump'),
        onPressed: () {
          Navigator.push(context, 
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder:  (BuildContext ctx, Animation animation, Animation secondaryAnimation){
                return FadeTransition(
                  opacity: animation,
                  child: new TipRoute(
                    text: "动画你的健康是否iu回事"
                  ),
                );
              }
              
            )
          
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