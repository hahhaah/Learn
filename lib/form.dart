import 'package:flutter/material.dart';


void main(){
  runApp(new MaterialApp(
    home: FormTestRoute(),
  ));
}
class FormTestRoute extends StatefulWidget {
  FormTestRoute({Key key}) : super(key: key);

  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  GlobalKey _key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text("Form Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
        child: Form(
          key: _key,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)
                ),
                validator: (v){
                  return v.trim().length>0?null:"用户名不能为空";
                },
              ),

              TextFormField(
                controller: _pwdController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock)
                ),
                obscureText: true,
                validator: (v){
                  return v.trim().length>5?null:"密码不能少于6位";
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text('login'),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          if((_key.currentState as FormState).validate()){
                            showDialog(context: context,builder: (context)=>AlertDialog(
                              title: Text("提示"),
                              content: Text('登录成功'),
                            ));
                          }
                        },
                      )
                    ),
                  ],
                ),
              ),
            
              Padding(
                padding: EdgeInsets.only(top:20.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[100],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top:20.0),
                child: SizedBox(
                  height: 7,
                  width: 7,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[100],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}