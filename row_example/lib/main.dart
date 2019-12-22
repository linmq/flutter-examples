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

  Widget _buildRow_1() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text('Deliver features faster', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(),
          ),
        ),
      ],
    );
  }

  Widget _buildRow_2() {
    return Row(
      children: <Widget>[
        const FlutterLogo(),
        const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
        const Icon(Icons.sentiment_very_satisfied),
      ],
    );
  }

  Widget _buildRow_3() {
    return Row(
      children: <Widget>[
        const FlutterLogo(),
        const Expanded(
          child: Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
        ),
        const Icon(Icons.sentiment_very_satisfied),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: _buildRow_1(),
      // body: _buildRow_2(),
      // body: _buildRow_3(),
      body: Column(
        // the default alignment of Column is Center
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildRow_1(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
          ),
          _buildRow_2(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
          ),
          _buildRow_3(),
        ],
      ),
    );
  }
}
