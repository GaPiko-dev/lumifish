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
        ListTile( title: Text("Nous contacter"), leading: Icon(Icons.accessibility_new_outlined)),
        ListTile( title: Text("Signaler un dysfonctionnement"), leading: Icon(Icons.warning_amber_outlined)),
      ],
    );
  }
}