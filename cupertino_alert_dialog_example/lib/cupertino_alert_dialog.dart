import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldAlertDialog extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('TextField in Dialog'),
          // content: TextField(
          //   controller: _textFieldController,
          //   decoration: InputDecoration(hintText: "TextField in Dialog"),
          // ),
          content: Text('a'),
          actions: <Widget>[
            new TextButton(
              child: new Text('CANCEL'),
              onPressed: () {
                print(_textFieldController.text);
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text('OK'),
              onPressed: () {
                print(_textFieldController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField in AlertDialog'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Alert Dialog'),
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}