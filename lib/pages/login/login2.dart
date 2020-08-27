import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new LogincheckPage(),
  ));
}

class LogincheckPage extends StatefulWidget {
  LogincheckPage({Key key}) : super(key: key);

  @override
  _LogincheckPageState createState() => _LogincheckPageState();
}

class _LogincheckPageState extends State<LogincheckPage> {
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  void _login() {
    print({'phone': phoneCtrl.text, 'pwd': pwdCtrl.text});
    if (phoneCtrl.text.length != 11) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('手机号位数不对'),
              ));
    } else if (pwdCtrl.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请输入密码'),
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('登录成功'),
              ));
      phoneCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入和选择'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: phoneCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.phone),
              hintText: "请输入手机号",
            ),
            autofocus: true,
          ),
          TextField(
            controller: pwdCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "请输入密码",
            ),
            autofocus: false,
            obscureText: true,
          ),
          RaisedButton(
            onPressed: test3,
            child: Text('登录'),
          )
        ],
      ),
    );
  }

  //表示一个异步操作的最终完成（或失败）及其结果值的表示
  void test() {
    Future.delayed(Duration(seconds: 2), () {
      //return "hi world!";
      throw AssertionError("Error");
    }).then((data) {
      print('success');
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      print('finally');
    });
  }

  void test2() {
    Future.wait([
      Future.delayed(new Duration(seconds: 2), () {
        return "hello";
      }),
      Future.delayed(new Duration(seconds: 5), () {
        return " world";
      }),
    ]).then((results) {
      print(results[0] + results[1]);
    }).catchError((e) {
      print(e);
    });
  }

  void test3() {
    Stream.fromFutures([
      Future.delayed(new Duration(seconds: 1), () {
        return "hello 1";
      }),
      // 抛出一个异常
      Future.delayed(new Duration(seconds: 2), () {
        throw AssertionError("Error");
      }),
      // 3秒后返回结果
      Future.delayed(new Duration(seconds: 3), () {
        return "world 3";
      })
    ]).listen((data) {
      print(data);
    }, onError: (e) {
      print(e);
    }, onDone: () {
      print('done!');
    });
  }
}
