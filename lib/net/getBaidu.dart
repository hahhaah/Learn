import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('data'),),
        body: HttpTestRoute(),
      ),
    )
  );
}

class HttpTestRoute extends StatefulWidget {
  HttpTestRoute({Key key}) : super(key: key);

  @override
  _HttpTestRouteState createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {

  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
       child: SingleChildScrollView(
         child: Column(
           children: <Widget>[
              RaisedButton(
                child: Text("获取百度首页"),
                onPressed: _loading?null:() async{
                  setState(() {
                    _loading = true;
                    _text = "正在请求中";
                  });
                  try{
                    HttpClient client = new HttpClient();
                    HttpClientRequest request = await client.getUrl(
                      Uri.parse("https://www.baidu.com")
                    );
                    //设置请求头
                    //request.headers.add(name, value)
                    HttpClientResponse response = await request.close();
                    _text = await response.transform(utf8.decoder).join();
                    print(response.headers);

                    client.close();
                  }catch(e){
                    _text = "请求失败:$e";
                  }finally{
                    setState(() {
                      _loading = false;
                    });
                  }
                }
              ),
              Container(
                width: 200.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), ""))
              )
           ],
         ),
       ),
    );
  }
}