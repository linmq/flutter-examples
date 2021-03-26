import 'dart:async';

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
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;

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

  void _addDataToStream() async {
    print('Add');
    String data = await fetchData();
    _streamController.add(data);
  }

  void _pauseStream() {
    print('Pause');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume');
    // after resume, the data in the stream will be output in the console
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel');
    // after cancel, the data in the stream is gone and can not recovery
    _streamSubscription.cancel();
  }

  @override
  void initState() {
    super.initState();

    // Create a Stream
    print('Create a Stream');
    // Create a Stream and get data from Future
    // Stream<String> _stream = Stream.fromFuture(fetchData());
    _streamController = new StreamController<String>();

    print('Start listening this Stream');
    _streamSubscription = _streamController.stream.listen(onData, onError: onError, onDone: onDone);

    print('Finish');
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  color: Theme.of(context).accentColor,
                  onPressed: _addDataToStream,
                ),
                SizedBox(width: 30,),
                FlatButton(
                  child: Text('Pause'),
                  color: Theme.of(context).accentColor,
                  onPressed: _pauseStream,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Resume'),
                  color: Theme.of(context).accentColor,
                  onPressed: _resumeStream,
                ),
                SizedBox(width: 30,),
                FlatButton(
                  child: Text('Cancel'),
                  color: Theme.of(context).accentColor,
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ), 
      ),
    );
  }
}
