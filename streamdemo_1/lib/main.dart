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
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // the data parameter here is data from _stream
  void onData(String data) {
    print('$data');
  }

  void onDone() {
    print('-----Done-----!');
  }

  void onError(error) {
    print('Error: $error');
  }

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 2));  // delay 2 second then return data
    return "I am the data in the Stream";
  }

  @override
  void initState() {
    super.initState();

    // Create a Stream
    print('Create a Stream');
    // Create a Stream and get data from Future
    Stream<String> _stream = Stream.fromFuture(fetchData());

    print('Start listening this Stream');
    _stream.listen(onData, onError: onError, onDone: onDone);

    print('Finish');
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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
