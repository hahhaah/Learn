import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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