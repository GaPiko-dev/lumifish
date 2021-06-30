import 'package:flutter/material.dart';

class ParametresWidget extends StatefulWidget {
  const ParametresWidget({Key? key}) : super(key: key);

  @override
  _ParametresWidgetState createState() => _ParametresWidgetState();
}

class _ParametresWidgetState extends State<ParametresWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile( title: Text("Comment ça marche ?"), leading: Icon(Icons.waves)),
        ListTile( title: Text("Anchor"), leading: Icon(Icons.anchor)),
        ListTile( title: Text("Alarm"), leading: Icon(Icons.access_alarm)),
        ListTile( title: Text("Ballot"), leading: Icon(Icons.ballot))
      ],
    );
  }
}