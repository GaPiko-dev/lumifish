import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flex_color_picker/flex_color_picker.dart';

import 'main.dart';

class PoissonsWidget extends StatefulWidget {
  const PoissonsWidget({Key? key}) : super(key: key);

  @override
  _PoissonsWidgetState createState() => _PoissonsWidgetState();
}

class _PoissonsWidgetState extends State<PoissonsWidget> {
  void ButtonClick() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (c) => PoissonConfig()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image(
              image: AssetImage('images/jaugev2.png'),
              width: 150),
            Text(
              "Bonne nouvelle ! L'eau est plutôt propre aujourd'hui !",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Image(
          image: AssetImage('images/poisson_app.jpg'),
          width: 300,
        ),
        TextButton(
            onPressed: ButtonClick,
            child: Text("Clique pour changer de couleur"))
      ],
    );
  }
}

class AnimationParameters {
  String animName;
  String description;
  bool isUnlocked;
  String fctName;
  bool colorPicker;
  bool speedSlider;

  AnimationParameters(this.animName, this.description, this.isUnlocked,
      this.fctName, this.colorPicker, this.speedSlider);
}

class PoissonConfig extends StatefulWidget {
  const PoissonConfig({Key? key}) : super(key: key);

  @override
  _PoissonConfigState createState() => _PoissonConfigState();
}

class _PoissonConfigState extends State<PoissonConfig> {
  Future<http.Response> Static(red, green, blue) {
    return http.post(
      Uri.parse('http://10.3.141.1:3000/sendRGB'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int>{
        'id': MyApp.poisson_id,
        'red': red,
        'green': green,
        'blue': blue,
      }),
    );
  }

  Future<http.Response> Blink(red, green, blue, wait) {
    return http.post(
      Uri.parse('http://10.3.141.1:3000/sendBLINK'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int>{
        'id': MyApp.poisson_id,
        'red': red,
        'green': green,
        'blue': blue,
        'wait': wait,
      }),
    );
  }

  Future<http.Response> Rainbow(wait) {
    return http.post(
      Uri.parse('http://10.3.141.1:3000/sendRAINBOW'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, int>{
        'id': MyApp.poisson_id,
        'wait': wait,
      }),
    );
  }

  void UpdateLED() {
    AnimationParameters a = animParams[currentlyActivated];
    if (a.fctName == "BLINK") {
      Blink(myColor.red, myColor.green, myColor.blue, waitTime);
    } else if (a.fctName == "STATIC") {
      Static(myColor.red, myColor.green, myColor.blue);
    } else {
      Rainbow(waitTime);
    }
  }

  void ButtonActivateClick(index) {
    setState(() => currentlyActivated = index);
    UpdateLED();

    //SendRGB();
  }

  void SliderActivate(wait) {
    setState(() => waitTime = wait);
    UpdateLED();

    //SendRGB();
  }

  void ButtonCustomClick() {
    print("Custom animation");
  }

  void ChangeColor(c) {
    setState(() => myColor = c);
    UpdateLED();
    //SendRGB();
  }

  final List<AnimationParameters> animParams = [
    new AnimationParameters("Rainbow", "Toutes les couleurs de l'arc en ciel",
        true, "RAINBOW", false, true),
    new AnimationParameters(
        "Clignotement", "Bip bip bop", true, "BLINK", true, true),
    new AnimationParameters(
        "Static", "Une couleur fixe", true, "STATIC", true, false),
    new AnimationParameters(
        "Stars", "Ca scintille !", false, "OSEF", false, false),
    new AnimationParameters(
        "Fire", "Fiiiiirrre !", false, "OSEF", false, false),
    new AnimationParameters(
        "Wave", "Vagues de lumière", false, "OSEF", false, false),
    new AnimationParameters(
        "Explosion", "C'est explosif", false, "OSEF", false, false)
  ];

  Color myColor = Colors.blue;
  var waitTime = 10.0;

  var currentlyActivated = 0;

  Widget ParameterCard(AnimationParameters p) {
    var isActivated = currentlyActivated == animParams.indexOf(p);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.waves),
          title: Text(p.animName),
          subtitle: Text(p.description),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (p.isUnlocked && !isActivated)
              TextButton(
                child: const Text('ACTIVER'),
                onPressed: () => ButtonActivateClick(animParams.indexOf(p)),
              )
            else if(!isActivated)
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.lock),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            const SizedBox(width: 8),
          ],
        ),
        if (p.colorPicker && isActivated)
          ColorPicker(
            enableShadesSelection: false,
            color: myColor,
            onColorChanged: ChangeColor,
            pickersEnabled: const <ColorPickerType, bool>{
              ColorPickerType.accent: false,
            },
          )
        else
          Container(),
        if (p.speedSlider && isActivated)
          Slider(
              value: waitTime,
              min: 0,
              max: 100,
              divisions: 10,
              label: waitTime.round().toString(),
              onChanged: SliderActivate)
        else
          Container(),
        SizedBox(height:25),
        const SizedBox(
          width: 450.0,
          height: 1.0,
          child: const DecoratedBox(
            decoration: const BoxDecoration(color: Colors.black),
          ),
        ), SizedBox(height:25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configuration du poisson")),
      body: ListView(
          children: [for (var param in animParams) ParameterCard(param)]),
    );
  }
}