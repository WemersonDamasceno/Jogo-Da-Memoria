import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/card_game_widget.dart';
import 'package:jogo_da_memoria/controllers/game_controller.dart';

class JogoDaMemoria extends StatefulWidget {
  const JogoDaMemoria({Key? key}) : super(key: key);

  @override
  State<JogoDaMemoria> createState() => _JogoDaMemoriaState();
}

class _JogoDaMemoriaState extends State<JogoDaMemoria> {
  int pontos = 0;
  final game = GameController();

  @override
  void initState() {
    super.initState();
    game.listaDeCartas.shuffle();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Jogo da memória",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            "Pontos $pontos",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: size.height * .7,
            width: size.width * 0.9,
            child: GridView.builder(
              itemCount: game.quantidadeCartas,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 3,
              ),
              itemBuilder: (context, index) {
                var item = game.listaDeCartas[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (game.listaDeCartas[index].isEscondida) {
                        game.listaDeCartas[index].isEscondida = false;
                        game.cartasIguais.add(
                          {index: game.listaDeCartas[index]},
                        );
                      }
                    });
                    //se as cartas forem iguais
                    if (game.cartasIguais.length == 2) {
                      if (game.cartasIguais[0].values.first.valor ==
                          game.cartasIguais[1].values.first.valor) {
                        pontos += 100;
                        game.cartasIguais.clear();
                      } else {
                        //se não forem igual limpa
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setState(() {
                            game.listaDeCartas[game.cartasIguais[0].keys.first]
                                .isEscondida = true;
                            game.listaDeCartas[game.cartasIguais[1].keys.first]
                                .isEscondida = true;
                            game.cartasIguais.clear();
                          });
                        });
                      }
                    }
                  },
                  child: CardGameWidget(
                    isEscondida: item.isEscondida,
                    pathImage: game.listaDeCartas[index].pathImage,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
