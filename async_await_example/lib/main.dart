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
  String _result = "";

  Future<String> createOrderMessage() async {
    print('Awaiting user order...'); // if swap this line with the next line, the result will be different
    var order = await fetchUserOrder();
    print('Your order is: $order');
    
    return 'Your order is: $order';
  }

  Future<String> fetchUserOrder() async {
    // Imagine that this function is more complex and slow
    return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
  }

  // You can ignore this function - it's here to visualize delay time in this example.
  void countSeconds(s) {
    for( var i = 1 ; i <= s; i++ ) {
        Future.delayed(Duration(seconds: i), () => print(i));
    }
  }

  Future<void> _handlePressButton() async {
    countSeconds(4);
    String orderMsg = await createOrderMessage();
    setState(() {
      _result = orderMsg;
    });
    // print('$orderMsg');
  }

// ==================================================================================

  void printOrderMessage () async {
    try {
      var order = await fetchUserOrder2();
      print('Awaiting user order...');
      print(order);
    } catch (err) {
      print('Caught error: $err');
      setState(() {
        _result = ('Caught error: $err');
      });
    }
  }

  Future<String> fetchUserOrder2() {
    // Imagine that this function is more complex.
    var str = Future.delayed(Duration(seconds: 4), () => throw 'Cannot locate user order');
    return str;
  }

  Future<void> _handlePressButton2() async {
    countSeconds(4);
    await printOrderMessage();
  }

// ==================================================================================

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
              'The order message is:',
            ),
            Text(
              '$_result',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handlePressButton2,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
