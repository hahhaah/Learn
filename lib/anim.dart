import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: ColorAnim(),
    ),
  ));
}

class ProgressTest extends StatefulWidget {
  ProgressTest({Key key}) : super(key: key);

  @override
  _ProgressTestState createState() => _ProgressTestState();
}

class _ProgressTestState extends State<ProgressTest>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.forward();
    _controller.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_controller), // 从灰色变成蓝色
              value: _controller.value,
            ),
          ),
          Container(
            height: 100,
            width: 130,
            color: Colors.black,
            child: Transform(
              transform: new Matrix4.skewY(0.3),
              alignment: Alignment.topRight,
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Aaaa'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorAnim extends StatefulWidget {
  ColorAnim({Key key}) : super(key: key);

  @override
  _ColorAnimState createState() => _ColorAnimState();
}

class _ColorAnimState extends State<ColorAnim>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3));

    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/bdlogo.png"),
      width: animation.value,
      height: animation.value,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyAnim extends AnimatedWidget {
  MyAnim({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
        "images/bdlogo.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}



class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/bdlogo.png") ,
      builder: (BuildContext ctx, Widget param){
        return new Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: param,
          ),
        );
      },
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({this.child,this.animation, key}) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation, 
        child: child,
        builder: (BuildContext ctx, Widget child){
          return Container(
            child: child,
            height: animation.value,
            width: animation.value,
          );
        }   
      ),
    );
  }
}