import 'package:flutter/material.dart';
import 'package:simple_map/pages/home.dart';
import 'package:simple_map/pages/map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapPage(121.5, 24.5, 5),
    );
  }
}
