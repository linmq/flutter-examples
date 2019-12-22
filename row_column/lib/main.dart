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

  // Row examples
  Column _buildColumn1() {
    return Column(
      // test Row alignment, remove Column alignment by default
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          // if mainAxisSize is MainAxisSize.min, will ignore mainAxisAlignment
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,  
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text(" hello world ", style: TextStyle(fontSize: 30.0),),
            Text(" I am Jack "),
          ],
        ),
      ],
    );
  }

  Column _buildColumn2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("hi"),
        Text("world"),
      ],
    );
  }

  // Let the Column take all the horizontal space
  // Method one
  Widget _buildColumn3() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('hi'),
          Text('world'),
        ],
      ),
    );
  }

  // Let the Column take all the horizontal space
  // Method two
  Widget _buildColumn4() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('hi'),
          Text('world'),
        ],
      ),
    );
  }

  // Column inside a Column
  Widget _buildColumn5() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕 valid, outside Column's height is the whole screen 
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度 invalid, inside Column's height is the actual height
                children: <Widget>[
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Column inside a Column
  // and the inside Column take as much space as its parent Column
  // 如果要让里面的 Column 占满外部 Column
  Widget _buildColumn6() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕 valid, outside Column's height is the whole screen 
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度 invalid, inside Column's height is the actual height
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: _buildColumn1(),
      // body: _buildColumn2(),
      // body: _buildColumn3(),
      // body: _buildColumn4(),
      // body: _buildColumn5(),
      body: _buildColumn6(),
    );
  }
}
