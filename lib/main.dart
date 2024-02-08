import 'package:flutter/material.dart';
import 'polygon_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polygon Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PolygonDrawer(),
    );
  }
}
