import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: MyHomePage(title: 'Flutter Demo shared_preferences'),
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
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _getCouterValue();
  }

  void _getCouterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    await prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/* Saving and reading data in Flutter with SharedPreferences
   https://medium.com/@suragch/saving-and-reading-data-in-flutter-with-sharedpreferences-bb4238d3105
*/

// int
// read
// final myInt = prefs.getInt('my_int_key') ?? 0;
// write
// prefs.setInt('my_int_key', 42);

// double
// read
// final myDouble = prefs.getDouble('my_double_key') ?? 0.0;
// write
// prefs.setBool('my_bool_key', true);

// bool
// read
// final myBool = prefs.getBool('my_bool_key') ?? false;
// write
// prefs.setBool('my_bool_key', true);

// string
// read
// final myString = prefs.getString('my_string_key') ?? '';
// write
// prefs.setString('my_string_key', 'hello');

// stringList
// read
// final myStringList = prefs.getStringList('my_string_list_key') ?? [];
// write
// prefs.setStringList('my_string_list_key', ['horse', 'cow', 'sheep']);