
import 'package:flutter/material.dart';

class RedStarTaskWidget extends StatefulWidget {
  RedStarTaskWidget({Key key}) : super(key: key);

  @override
  _RedStarTaskWidgetState createState() => _RedStarTaskWidgetState();
}

class _RedStarTaskWidgetState extends State<RedStarTaskWidget> {

  int _taskCount = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0)
          ),
          width: double.infinity,
          height: 130.0,
          margin:EdgeInsets.symmetric(horizontal: 10.0),
          padding:const EdgeInsets.symmetric(vertical: 32.0,horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        '红星任务',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    Text(
                      '17个任务，完整可获得好的开科比',
                      style: new TextStyle(
                        color: Colors.grey[500],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: 70.0,
                margin: EdgeInsets.only(left:5.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:Text(
                  '做任务',
                  style: TextStyle(
                    color:  Colors.blue,
                    fontSize: 16.0
                  ),
                ),),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              
            ],

          ),
    );
  }
}
