import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  Widget _buildConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能大 as wide as possible
        minHeight: 50.0 //最小高度为50像素 minHeight is 50 px
      ),
      child: Container(
        height: 5.0, // Finally, its height is 50 px
        child: redBox
      ),
    );
  }

  // this effect is the same as _buildBoxConstraintsTightFor()
  Widget _buildSizedBox() {
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: redBox
    );
  }

  // this effect is the same as _buildSizedBox()
  Widget _buildBoxConstraintsTightFor() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
      child: redBox,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: _buildConstrainedBox(),
      // body: _buildSizedBox(),
      body: _buildBoxConstraintsTightFor(),
    );
  }
}
