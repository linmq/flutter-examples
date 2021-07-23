import 'package:flutter/material.dart';
import 'package:cupertino_alert_dialog_example/cupertino_alert_dialog.dart';

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
      ),
      home: TextFieldAlertDialog(),
    );
  }
}