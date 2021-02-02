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
    fit: StackFit.expand,
    children: <Widget>[
      Image.asset(
        'images/ali_landscape.png',
        fit: BoxFit.cover,
        height: 256.0,
      ),
      // This gradient ensures that the toolbar icons are distinct
      // against the background image.
      const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, .35),
            colors: <Color>[Color(0xC0000000), Color(0x00000000)],
          ),
        ),
      ),
    ],
  );
  // #enddocregion Stack
}