import 'package:flutter/material.dart';

class FadeRoute extends PageRoute{
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });
  
  final WidgetBuilder builder;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final bool maintainState;

  @override
  final Duration transitionDuration;


  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {

    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}


void main() => runApp(new MaterialApp(home: RouterTestRoute(),));

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: RaisedButton(
        child: Text('click to jump'),
        onPressed: () {
          Navigator.push(context, FadeRoute(builder: (context){
            return TipRoute(text: "sgfiusgfuys",);
          })
            
          
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