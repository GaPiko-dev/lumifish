import 'package:flutter/material.dart';

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
        Row(children: [
          Image.network(
              'https://image.flaticon.com/icons/png/512/743/743418.png',
              scale: 10),
          Text("Ammonium en grande concentration")
        ]),
        Image.network(
            'https://static.vecteezy.com/ti/vecteur-libre/t2/2534491-poisson-rouge-dessine-a-la-main-gratuit-vectoriel.jpg',
            scale: 0.8),
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
  bool canPersonnaliser;
  bool isUnlocked;

  AnimationParameters(
      this.animName, this.description, this.canPersonnaliser, this.isUnlocked);
}

class PoissonConfig extends StatelessWidget {
  void ButtonActivateClick() {
    print("Animation activée");
  }

  void ButtonCustomClick() {
    print("Custom animation");
  }

  final List<AnimationParameters> animParams = [
    new AnimationParameters(
        "Rainbow", "Toutes les couleurs de l'arc en ciel", true, true),
    new AnimationParameters("Clignotement", "Bip bip bop", true, true),
    new AnimationParameters("Static", "Une couleur fixe", true, true),
    new AnimationParameters("Stars", "Des étoiles ou quoi ?", true, false),
    new AnimationParameters("Fire", "Le feu ou quoi ?", false, false),
    new AnimationParameters(
        "Epilepsie", "Non non ça clignote à fond", false, false),
    new AnimationParameters("Golden Boudin", "Le golden boudin", true, false)
  ];

  PoissonConfig({Key? key}) : super(key: key);

  Widget ParameterCard(AnimationParameters p) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.waves),
          title: Text(p.animName),
          subtitle: Text(p.description),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text('ACTIVER'),
              onPressed: ButtonActivateClick,
            ),
            const SizedBox(width: 8),
            if (p.canPersonnaliser == true)
              TextButton(
                child: const Text('PERSONNALISER'),
                onPressed: ButtonCustomClick,
              )
            else
              Container(),
            const SizedBox(width: 8),
          ],
        ),

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
