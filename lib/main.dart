import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/info_card.dart';

import 'models/game_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Game _game = Game();

  //game stats
  int tentativas = 0;
  int pontos = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              info_card("Tentativas", "$tentativas"),
              info_card("Pontos", "$pontos"),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: GridView.builder(
              itemCount: _game.gameImg!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 3,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //incrementing the clicks
                        tentativas++;
                        _game.gameImg![index] = _game.listaDeImagens[index];
                        _game.cartasIguais.add(
                          {
                            index: _game.listaDeImagens[index],
                          },
                        );
                      });
                      //se as cartas forem iguais
                      if (_game.cartasIguais.length == 2) {
                        if (_game.cartasIguais[0].values.first ==
                            _game.cartasIguais[1].values.first) {
                          //incrementing the score
                          pontos += 100;
                          _game.cartasIguais.clear();
                        } else {
                          //se não forem igual limpa
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {
                              _game.gameImg![_game.cartasIguais[0].keys.first] =
                                  _game.hiddenCardpath;
                              _game.gameImg![_game.cartasIguais[1].keys.first] =
                                  _game.hiddenCardpath;
                              _game.cartasIguais.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Card(
                      elevation: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
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
