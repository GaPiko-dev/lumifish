import 'package:flutter/material.dart';

class PoissonsWidget extends StatefulWidget {
  const PoissonsWidget({Key? key}) : super(key: key);

  @override
  _PoissonsWidgetState createState() => _PoissonsWidgetState();
}

class _PoissonsWidgetState extends State<PoissonsWidget> {
  void ButtonClick()
  {
    print("mdr");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Image.network('https://image.flaticon.com/icons/png/512/743/743418.png',
            scale:10
          ),
          Text("Ammonium en grande concentration")
        ]),
        Image.network(
            'https://static.vecteezy.com/ti/vecteur-libre/t2/2534491-poisson-rouge-dessine-a-la-main-gratuit-vectoriel.jpg',
            scale: 0.8),
        FlatButton(onPressed: ButtonClick, child: Text("Clique pour changer de couleur"))
      ],
      
    );
  }
}
