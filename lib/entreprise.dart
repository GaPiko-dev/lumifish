import 'package:flutter/material.dart';

class EntrepriseWidget extends StatefulWidget {
  const EntrepriseWidget({Key? key}) : super(key: key);

  @override
  _EntrepriseWidgetState createState() => _EntrepriseWidgetState();
}

class _EntrepriseWidgetState extends State<EntrepriseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
    Image(image: AssetImage('images/edf-logo.jpg'), width: 300,),
          Text("")
        ]),
        Image(image: AssetImage('images/poisson_app.jpg'), width: 300,),
        //TextButton(
          //  onPressed:(){},
            //child: Text("Lire"))
      ],
    );
  }
}
