import 'package:flutter/material.dart';

class AchatsWidget extends StatefulWidget {
  const AchatsWidget({Key? key}) : super(key: key);

  @override
  _AchatsWidgetState createState() => _AchatsWidgetState();
}

class _AchatsWidgetState extends State<AchatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('images/achatsv2.png'));
  }
}
