import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/jogo%20da%20imitacao/models/animal_item_model.dart';
import 'package:jogo_da_memoria/jogo%20da%20imitacao/pages/widgets/animal_item_widget.dart';

class JogoDaImitacaoPage extends StatefulWidget {
  const JogoDaImitacaoPage({Key? key}) : super(key: key);

  @override
  State<JogoDaImitacaoPage> createState() => _JogoDaImitacaoPageState();
}

class _JogoDaImitacaoPageState extends State<JogoDaImitacaoPage> {
  bool playing = false;
  late AudioPlayer _player;
  late AudioCache cache;
  IconData iconPlay = Icons.play_circle_outline_rounded;

  AnimalItemModel animalFoco = AnimalItemModel(
    pathImage: "assets/images/jogo_imitacao/animais/cabra.png",
    som: "cabra",
  );

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  escolhaAnimalReproduzirFonema(String animalSom) {
    switch (animalSom) {
      case "vaca":
        tocarSom("fonema_m.mp3");
        break;
      case "cobra":
        tocarSom("fonema_s.mp3");
        break;
      case "abelha":
        tocarSom("fonema_z.mp3");
        break;
      case "cabra":
        tocarSom("fonema_m2.mp3");
        break;
      case "galinha":
        tocarSom("fonema_p.mp3");
        break;
    }
  }

  tocarSom(String fonemaEscolhido) {
    setState(() {
      if (!playing) {
        iconPlay = Icons.pause_circle_outline_rounded;
        cache.play("images/jogo_imitacao/audios/$fonemaEscolhido");
        playing = true;
        Future.delayed(Duration(milliseconds: 2500)).then((value) {
          setState(() {
            iconPlay = Icons.play_circle_outline_rounded;
            playing = false;
          });
        });
      } else {
        iconPlay = Icons.play_circle_outline_rounded;
        _player.pause();
        playing = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.2,
            right: 0,
            left: 0,
            child: Image.asset("assets/images/jogo_imitacao/palco.jpg"),
          ),
          Positioned(
            top: height * 0.3,
            right: 0,
            left: 0,
            child: SizedBox(
              height: height * 0.2,
              child: Image.asset(animalFoco.pathImage),
            ),
          ),
          Positioned(
            top: height * 0.55,
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      escolhaAnimalReproduzirFonema(animalFoco.som);
                    },
                    child: Icon(
                      iconPlay,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.mic_none_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              height: height * 0.2,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/images/jogo_imitacao/animais/cabra.png";
                        animalFoco.som = "cabra";
                      });
                    },
                    pathImage: "assets/images/jogo_imitacao/animais/cabra.png",
                    padding: 0,
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/images/jogo_imitacao/animais/vaca.png";
                        animalFoco.som = "vaca";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/images/jogo_imitacao/animais/vaca.png",
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/images/jogo_imitacao/animais/abelha.png";
                        animalFoco.som = "abelha";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/images/jogo_imitacao/animais/abelha.png",
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/images/jogo_imitacao/animais/galinha.png";
                        animalFoco.som = "galinha";
                      });
                    },
                    padding: 0,
                    pathImage:
                        "assets/images/jogo_imitacao/animais/galinha.png",
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/images/jogo_imitacao/animais/cobra.png";
                        animalFoco.som = "cobra";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/images/jogo_imitacao/animais/cobra.png",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
