import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encryptLib;

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
  var _encryptedContent;

  _encryptTest() {
    final plainText = "this is plain text";
    final key = encryptLib.Key.fromUtf8('d45ad84d45c1d998d118a7cc6d88dba7');
    final iv = encryptLib.IV.fromLength(16);
    final encrypter = encryptLib.Encrypter(encryptLib.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted.base64);
    _encryptedContent = encrypted.base64;
    _decryptTest();
  }

  _decryptTest() {
    final key = encryptLib.Key.fromUtf8('d45ad84d45c1d998d118a7cc6d88dba7');
    final iv = encryptLib.IV.fromLength(16);
    final encrypter = encryptLib.Encrypter(encryptLib.AES(key));
    final decrypted = encrypter.decrypt64(_encryptedContent, iv: iv);
    print(decrypted);
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
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.display1,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _encryptTest,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
