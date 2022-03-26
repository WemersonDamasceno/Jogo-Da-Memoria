import 'package:flutter/material.dart';

class JogoDaImitacaoPage extends StatefulWidget {
  const JogoDaImitacaoPage({Key? key}) : super(key: key);

  @override
  State<JogoDaImitacaoPage> createState() => _JogoDaImitacaoPageState();
}

class _JogoDaImitacaoPageState extends State<JogoDaImitacaoPage> {
  String animalFoco = "assets/images/jogo_imitacao/elefante.png";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(""),
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
              child: Hero(
                tag: "animal_foco",
                child: Image.asset(animalFoco),
              ),
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
                    onTap: () {},
                    child: Icon(
                      Icons.play_circle_outline_rounded,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        animalFoco = "assets/images/jogo_imitacao/cobra.png";
                      });
                    },
                    child: Image.asset(
                      "assets/images/jogo_imitacao/cobra.png",
                      width: width * 0.25,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        animalFoco = "assets/images/jogo_imitacao/cachorro.png";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        "assets/images/jogo_imitacao/cachorro.png",
                        width: width * 0.25,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        animalFoco = "assets/images/jogo_imitacao/elefante.png";
                      });
                    },
                    child: Image.asset(
                      "assets/images/jogo_imitacao/elefante.png",
                      width: width * 0.25,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        animalFoco = "assets/images/jogo_imitacao/abelha.png";
                      });
                    },
                    child: Image.asset(
                      "assets/images/jogo_imitacao/abelha.png",
                      width: width * 0.25,
                    ),
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
