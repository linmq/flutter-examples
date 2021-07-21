import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Container _buildContainer1() {
    return Container(
      child: Text('Boring'),
    );
  }

  Container _buildContainer2() {
    return Container(
      child: Text('Boring'),
      color: Colors.blue,
    );
  }

  Container _buildContainer3() {
    return Container(
      child: Text('Boring'),
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
    );
  }

  Container _buildContainer4() {
    return Container(
      child: Text('Boring'),
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
    );
  }

  Container _buildContainer5() {
    return Container(
      child: Text('Boring'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
    );
  }

  Container _buildContainer6() {
    return Container(
      child: Text('Boring'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
    );
  }

  Container _buildContainer7() {
    return Container(
      child: Text('Boring'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      padding: EdgeInsets.all(25.0),
      margin: EdgeInsets.all(40.0),
    );
  }

  // Once you set alignment the container, will expand to fill its parent’s width and height.
  Container _buildContainer8() {
    return Container(
      child: Text('Boring'),
      color: Colors.blue,
      alignment: Alignment.center,
    );
  }

  // Once you set alignment the container, will expand to fill its parent’s width and height.
  // You can override this by setting the container’s width and height.
  Container _buildContainer9() {
    return Container(
      child: Text('Boring'),
      color: Colors.blue,
      alignment: Alignment.center,
      width: 200,
      height: 100,
    );
  }

  Container _buildContainer10() {
    return Container(
      child: Text('Less boring'),
      color: Colors.blue,
      alignment: Alignment.center,
      constraints: BoxConstraints.tightForFinite(
        width: 200,
      ),
    );
  }

  Container _buildContainer11() {
    return Container(
      child: Text('Less boring'),
      color: Colors.blue,
      width: 200,
      height: 200,
      transform: Matrix4.rotationZ(0.05),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildContainer11(),
    );
  }
}

