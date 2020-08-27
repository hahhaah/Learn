import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
//连接到WebSocket服务器。
// 监听来自服务器的消息。
// 将数据发送到服务器。
// 关闭WebSocket连接。

void main() {
  runApp(MaterialApp(
    home:WebSocketRoute(),
  ));
}

class WebSocketRoute extends StatefulWidget {
  WebSocketRoute({Key key}) : super(key: key);

  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  void _sendMessage(){
    if(_controller.text.isNotEmpty){
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("WebSocket(内容回显)"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
              controller: _controller,
              decoration: new InputDecoration(labelText: 'Send a message'),
            )),
            StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  //网络不通会走到这
                  if (snapshot.hasError) {
                    _text = "网络不通";
                  } else if (snapshot.hasData) {
                    _text = "echo: " + snapshot.data;
                  }
                  return new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: new Text(_text),
                  );
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Send message',
        child: new Icon(Icons.send),
        onPressed: _sendMessage
      ),
    );
  }
}
