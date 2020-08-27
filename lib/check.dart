import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: TextContainer(),
  ));
}

class SwitchAndCheckBoxTest extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestState createState() =>
      new _SwitchAndCheckBoxTestState();
}

class _SwitchAndCheckBoxTestState extends State<SwitchAndCheckBoxTest> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Checkbox(
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            }),
        Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
      ],
    );
  }
}

class TextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    _controller.text = "文字的显示不能直接使用字符";
    _controller.selection = TextSelection(baseOffset: 3, extentOffset: 6);

    return Scaffold(
      appBar: AppBar(
        title: Text('textfiled'),
      ),
      body: new TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.access_time),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
        ),
        controller: _controller,
        maxLength: 15,
        maxLengthEnforced: true,
        autocorrect: true,
        focusNode: FocusNode(),
        autofocus: true,
      ),
    );
  }
}

class TextContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
            ),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "密码",
                    hintText: "您的登录密码",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)),
                obscureText: true,
              )
            ],
          )),
    );
  }
}
