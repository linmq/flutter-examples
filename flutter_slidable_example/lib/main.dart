import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: buildAnimalList(context),
      ),
    );
  }

  Widget buildAnimalList(BuildContext context) {
    List<Widget> items = [];
    items.add(_buildAnimalItem(context, 'dog'));
    items.add(_buildAnimalItem(context, 'cat'));
    return Container(
      child: Column(children: items),
    );
  }

  Widget _buildAnimalItem(BuildContext context, String data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text('3'),
              foregroundColor: Colors.white,
            ),
            title: Text(data),
            subtitle: Text('SlidableDrawerDelegate'),
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => print('Archive'),
          ),
          IconSlideAction(
            caption: 'Share',
            color: Colors.indigo,
            icon: Icons.share,
            onTap: () => print('Share'),
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'More',
            color: Colors.black45,
            icon: Icons.more_horiz,
            onTap: () => print('More'),
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => print('Delete'),
          ),
        ],
      ),
    );
  }
}
