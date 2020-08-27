import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


//父widget管理widget的state
/*
ParentWidgetState 类:
  为TapboxB 管理_active状态.
  实现_handleTapboxChanged()，当盒子被点击时调用的方法.
  当状态改变时，调用setState()更新UI.

TapboxB 类:
  继承StatelessWidget类，因为所有状态都由其父widget处理.
  当检测到点击时，它会通知父widget.
*/
void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'demo',
      home: new Scaffold(
        appBar: new AppBar(title:new Text('flutter demo')),
        body: new Center(
          child:new ParentWidget(),
        ),
      ),);
  }
}

class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();

}

class _ParentWidgetState extends State<ParentWidget>{
  bool _isActive = false;

  void _handleTapBoxChanged(bool newVal){
    setState(() {
      _isActive = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:new TapboxB(
        active:_isActive,
        onChanged:_handleTapBoxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key,this.active:false,@required this.onChanged}):super(key:key);
  
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        width: 150.0,
        height: 100.0,
        child:new Center(child: new Text(
          active?'active':'Inactive',
          style: new TextStyle(fontSize: 32.0, color: Colors.white),
        ),),
        decoration: new BoxDecoration(
          color: active?Colors.green:Colors.black54,
        ),
      ),
    );
  }
}
