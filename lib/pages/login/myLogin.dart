import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color colorRegular = Color(0xFF594E60);
  Color colorLight = Color(0xFFFF978F);
  Color colorInput = Color(0x40FFFFFF);
  Color colorWhite = Colors.white;

  BorderRadius _radius = BorderRadius.all(Radius.circular(20));

  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  void _login(){
    print({'phone':phoneCtrl.text,'pwd':pwdCtrl.text});
    if (phoneCtrl.text.length !=11) {
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("错误"),
          content: Text('请输入11位手机号码'),
      ));
    } else if(pwdCtrl.text.length == 0) {
      showDialog(context: context,
        builder: (context)=>AlertDialog(
          title: Text("错误"),
          content: Text('密码不能为空'),
        )
      );
    } else {
      showDialog(context: context,
        builder: (context)=>AlertDialog(
          title: Text("提示"),
          content: Text('登录成功'),
        )
      );
      onTextClear();
    }
  }

  void onTextClear() {
    setState(() {
      phoneCtrl.clear();
      pwdCtrl.clear();
    });
  }

  Container buildPhoneContainer(){
    return //用户名输入框
      Container(
      margin:
          EdgeInsets.only(top: 110, bottom: 39, left: 24, right: 24),
      decoration: BoxDecoration(
        borderRadius: _radius,
        color: colorInput,
      ),
      child: TextField(
        controller: phoneCtrl,
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            color: colorWhite,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15, vertical: 9),
          border: InputBorder.none,
          hintText: "请输入手机号",
          hintStyle: TextStyle(color: colorWhite, fontSize: 15),
          labelStyle: TextStyle(color: Colors.black, fontSize: 15),
        ),
        maxLines: 1,
        cursorColor: colorRegular,
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Container buildPwdContainer(){
    return Container(
      margin: EdgeInsets.only(bottom: 58, left: 24, right: 24),
      decoration: BoxDecoration(
        borderRadius: _radius,
        color: colorInput,
      ),
      child: 
        TextField(
          controller: pwdCtrl,
          decoration: InputDecoration(
            icon:Icon(Icons.lock,color: colorWhite,),
            contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 9),
            border: InputBorder.none,
            hintText: "请输入密码",
            hintStyle: TextStyle(color:colorWhite,fontSize: 15),
            labelStyle: TextStyle(color: Colors.black,fontSize: 15),
          ),
          maxLines: 1,
          cursorColor: colorRegular,
          keyboardType: TextInputType.number,
          obscureText: true,
        ),
    );
  }

  Container buildLoginBtn(){
    return  //登录按钮
      Container(
        height: 42,
        width: 300,
        margin: EdgeInsets.only(left: 24, right: 24),
        decoration:
            BoxDecoration(borderRadius: _radius, color: colorWhite),
        child: RaisedButton(
          onPressed: _login,
          elevation: 1, //按钮下面的阴影
          highlightElevation: 1,
          textColor: colorRegular,
          shape: RoundedRectangleBorder(borderRadius: _radius),
          child: Text(
            "立即登录",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorLight, colorRegular],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            buildPhoneContainer(),
            buildPwdContainer(),
            buildLoginBtn(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '登录/注册即代表您已同意《用户协议》',
                style: TextStyle(color: colorWhite, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
