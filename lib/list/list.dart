import 'package:flutter/material.dart';

import 'package:myapp/res/data.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list test',
      home: new Scaffold(
        body: new DynamicList(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.account_balance_wallet,
            size: 30,
          ),
          trailing: Icon(
            Icons.account_balance_wallet,
            size: 30,
          ),
          title: new Text(
            "Mac 每次都要执行source ~/.bash_profile 配置的环境变量才生效",
            style: TextStyle(fontSize: 14.0, color: Colors.amber),
          ),
          subtitle: new Text(
              ":~/.bash_profile发现zsh加载的是~/.zshrc文件，而‘.zshrc’文件中并没有定义任务环境变量。解决办法在~/.zshrc文件最后，增加一行：source ~/.bash_profile"),
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: new Text("Mac 每次都要执行source ~/.bash_profile 配置的环境变量才生效"),
          subtitle: new Text(
              "可是每次重启终端后配置的不生效.需要重新执行:~/.bash_profile发现zsh加载的是~/.zshrc文件，而‘.zshrc’文件中并没有定义任务环境变量。解决办法在~/.zshrc文件最后，增加一行：source ~/.bash_profile"),
        ),
        ListTile(
          title: new Text("Mac 每次都要执行source ~/.bash_profile"),
          subtitle: new Text(
              "可是每次重启终~/.zshrc文件，而‘.zshrc’文件中并没有定义任务环境变量。解决办法在~/.zshrc文件最后，增加一行：source ~/.bash_profile"),
        ),
        ListTile(
          title: new Text("Mac 每次都 配置的环境变量才生效"),
          subtitle: new Text(
              "可是每次重启终端后:~/.~/.zshrc文件，而‘.~/.zshrc文件最后，增加一行：source ~/.bash_profile"),
        ),
      ],
    );
  }
}

class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 180.0,
          height: 180.0,
          color: Colors.deepOrange,
        ),
        Container(
          height: 180.0,
          width: 180.0,
          color: Colors.deepPurpleAccent,
          child: ListView(
            children: <Widget>[
              Container(
                child: Text("1"),
                height: 10.0,
                color: Colors.red,
              ),
              Container(
                child: Text("2"),
                height: 10.0,
                color: Colors.yellow,
              ),
              Container(
                height: 180.0,
                width: 180.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Container(
          height: 180.0,
          width: 180.0,
          color: Colors.red,
        ),
        Container(
          height: 180.0,
          width: 180.0,
          color: Colors.yellow,
        ),
        Container(
          height: 180.0,
          width: 180.0,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class DynamicList extends StatelessWidget {
  List<Widget> list = new List();
  
  //自定义方法
  List<Widget> _getData() {
    for(var i=0;i<20;i++){
    list.add(ListTile(
        title: new Text(
          "Mac $i",
          style: TextStyle(fontSize: 14.0, color: Colors.amber),
        ),
      ));
    }
    return list;
  }

  List<Widget> _getOutData() {
    var tmp = data.map((value){
      return new ListTile(
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return tmp.toList();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _getOutData(),
    );
  }
}


class HomeContent3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Center(child: MaterialButton(
        color: Colors.blue,
        height: 50.0,
        textColor: Colors.white,
        child: new Text('点我'),
        
        onPressed: (){
          showDatePicker(
            context: context, 
            initialDate: DateTime.parse("20200715"), 
            firstDate: DateTime.parse("20200619"), 
            lastDate: DateTime.parse("20200830"),
            selectableDayPredicate: (dateTime){
              if(dateTime.day == 10 || dateTime.day==20){
                return false;
              } else{
                return true;
              }
            },
            initialDatePickerMode: DatePickerMode.day,
          ).then((date){
            print('当前选择了${date.month}月${date.day}日');
          });
        }
    ),);
  }
}

class TestDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return new Center(
      child:MaterialButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('点我'),
        onPressed: (){

        }
        
      )
    );
  }
}