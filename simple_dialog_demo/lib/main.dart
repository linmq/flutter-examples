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
      home: MyHomePage(title: "simple dialog",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Department { treasury, state }

class _MyHomePageState extends State<MyHomePage> {

  Future<void> _askedToLead() async {
    switch (await showDialog<Department>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select assignment'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, Department.treasury); },
              child: const Text('Treasury department'),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, Department.state); },
              child: const Text('State department'),
            ),
          ],
        );
      }
    )) {
      case Department.treasury:
        // Let's go.
        // ...
        print('treasury');
      break;
      case Department.state:
        // ...
        print('state');
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _askedToLead,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
