import 'package:flutter/material.dart';
import 'package:flutterhttpgetandpost/GetRequest/getRequest.dart';
import 'package:flutterhttpgetandpost/postRequest/postRequest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Http Get and post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetRequest(), //replace with PostRequest to work with POST
    );
  }
}
