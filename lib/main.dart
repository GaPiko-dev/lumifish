/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// the [currentIndex] is set to index 0. The selected item is amber in color.
// With each [BottomNavigationBarItem] widget, backgroundColor property is
// also defined, which changes the background color of [BottomNavigationBar],
// when that item is selected. The `_onItemTapped` function changes the
// selected item's index and displays a corresponding message in the center of
// the [Scaffold].

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'entreprise.dart';
import 'parametres.dart';
import 'achats.dart';
import 'blog.dart';
import 'poissons.dart';

void main() {
  GetID();
  runApp(const MyApp());
}

Future<void> GetID() async {
  http.Response r = await http.get(
    Uri.parse('http://10.3.141.1:3000/getID'),
    headers: {
      'Content-Type': 'application/json',
    },
  );
  MyApp.poisson_id = int.parse(r.body);
}
/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int poisson_id = 0;
  static const String _title = 'Lumifish';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MainWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PoissonsWidget(),
    AchatsWidget(),
    BlogWidget(),
    ParametresWidget(),
    EntrepriseWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lumifish'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Poisson',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ), BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
