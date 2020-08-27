import 'package:flutter/material.dart';

//hero动画
void main() {
  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: HeroRoute(),
    ),
  ));
}

class HeroRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "images/bdlogo.png",
                  width: 50.0,
                ),
              )),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("原图"),
                  ),
                  body: HeroRouteB(),
                ),
              );
            }));
          },
        ),
    );
  }
}

class HeroRouteB extends StatelessWidget {
  const HeroRouteB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/bdlogo.png"),
      ),
    );
  }
}
