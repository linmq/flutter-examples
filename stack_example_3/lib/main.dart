import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final showCard = false; // Set to false to show Stack

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Center(child: _buildStack()),
      ),
    );
  }

  // #docregion Stack
  Widget _buildStack() => Stack(
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      Container(
        width: 90,
        height: 90,
        color: Colors.green,
      ),
      Container(
        width: 80,
        height: 80,
        color: Colors.blue,
      ),
    ],
  );
  // #enddocregion Stack
}