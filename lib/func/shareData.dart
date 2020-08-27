import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareWidget(
         data: count,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 20.0),child: TestWidget(),),
              RaisedButton(
                child: Text("Increment"),
                onPressed: ()=>setState(()=> count++),
              )
           ],
         ),
      ),
    );
  }
}


class ShareWidget extends InheritedWidget{
  ShareWidget({@required this.data, Widget child}):super(child:child);

  final int data;

  static ShareWidget of(BuildContext context){
    //return context.dependOnInheritedWidgetOfExactType<ShareWidget>();
    return context.getElementForInheritedWidgetOfExactType<ShareWidget>().widget;
  }

  @override
  bool updateShouldNotify(ShareWidget oldWidget) {
    return oldWidget.data != data;
  }

}

class TestWidget extends StatefulWidget {
  TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
       ShareWidget.of(context).data.toString()
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('dependencies change');
  }
}
