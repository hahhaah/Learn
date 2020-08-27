import 'package:flutter/material.dart';
/***
 * 这个例子有两个状态对象_ParentWidgetState和_TapboxCState。
_ParentWidgetState 对象:

    管理_active 状态.
    实现 _handleTapboxChanged(), 当盒子被点击时调用.
    当点击盒子并且_active状态改变时调用setState()更新UI

_TapboxCState 对象:
    管理_highlight state.
    GestureDetector监听所有tap事件。当用户点下时，它添加高亮（深绿色边框）；当用户释放时，会移除高亮。
    当按下、抬起、或者取消点击时更新_highlight状态，调用setState()更新UI。
    当点击时，将状态的改变传递给父widget.
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

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }


}

class TapboxC extends StatefulWidget {
  TapboxC({Key key,this.active:false,@required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();

  
}

class _TapboxCState extends State<TapboxC>{

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight=true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight=false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: new Container(
        child:new Center(child: new Text(widget.active?'active':'inactive'),),
        width: 150.0,
        height: 150.0,
        decoration: new BoxDecoration(
          color:widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight?new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          ):null,
        ),
      ),
    );
  }
}