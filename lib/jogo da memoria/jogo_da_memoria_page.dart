import 'package:flutter/material.dart';

import 'components/card_game_widget.dart';
import 'controllers/game_controller.dart';

class JogoDaMemoriaPage extends StatefulWidget {
  const JogoDaMemoriaPage({Key? key}) : super(key: key);

  @override
  State<JogoDaMemoriaPage> createState() => _JogoDaMemoriaPageState();
}

class _JogoDaMemoriaPageState extends State<JogoDaMemoriaPage> {
  int pontos = 0;
  final gameController = GameController();
  bool exibirAnimacao = false;

  @override
  void initState() {
    super.initState();
    gameController.initGame();
    gameController.listaDeCartas.shuffle();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Jogo da memória"),
      ),
      body: SizedBox(
        height: size.height * 0.8,
        child: listaDasCartas(size),
      ),
    );
  }

  Widget listaDasCartas(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Pontos: $pontos",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              )),
        ),
        SizedBox(
          height: size.height * .7,
          width: size.width * 0.9,
          child: GridView.builder(
            itemCount: gameController.quantidadeCartas,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              var item = gameController.listaDeCartas[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (gameController.listaDeCartas[index].isEscondida) {
                      gameController.listaDeCartas[index].isEscondida = false;
                      gameController.cartasIguais.add(
                        {index: gameController.listaDeCartas[index]},
                      );
                    }
                  });
                  //se as cartas forem iguais
                  if (gameController.cartasIguais.length == 2) {
                    if (gameController.cartasIguais[0].values.first.valor ==
                        gameController.cartasIguais[1].values.first.valor) {
                      pontos += 100;
                      gameController.cartasIguais.clear();

                      //Se atingir os 600 pontos, acabou o jogo
                      if (pontos == 600) {
                        setState(() {
                          exibirAnimacao = true;
                        });
                      }
                    } else {
                      //Se não forem igual limpa
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          gameController
                              .listaDeCartas[
                                  gameController.cartasIguais[0].keys.first]
                              .isEscondida = true;
                          gameController
                              .listaDeCartas[
                                  gameController.cartasIguais[1].keys.first]
                              .isEscondida = true;
                          gameController.cartasIguais.clear();
                        });
                      });
                    }
                  }
                },
                child: CardGameWidget(
                  isEscondida: item.isEscondida,
                  pathImage: gameController.listaDeCartas[index].pathImage,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
