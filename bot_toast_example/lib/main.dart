import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer
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
  
  int backgroundColor = 0x42000000;
  int seconds = 2;
  bool clickClose = true;
  bool allowClick = true;
  bool crossPage = true;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    BotToast.showText(text:"xxxx");  //popup a text toast;
    BotToast.showSimpleNotification(title: "init"); // popup a sample notification toast;
    BotToast.showLoading(
      clickClose: clickClose,
      allowClick: allowClick,
      crossPage: crossPage,
      backButtonBehavior: backButtonBehavior,
      animationDuration:
          Duration(milliseconds: animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: animationReverseMilliseconds),
      duration: Duration(
        seconds: seconds,
      ),
      backgroundColor: Color(backgroundColor)); //popup a sample loading toast
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
              style: Theme.of(context).textTheme.display1,
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
