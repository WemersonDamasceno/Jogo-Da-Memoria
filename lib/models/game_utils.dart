import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.purple;
  List<Color>? gameColors;
  List<String>? gameImg;

  final String hiddenCardpath = "assets/images/hidden.png";
  List<String> listaDeImagens = [
    "assets/images/girafa.png",
    "assets/images/cachorro.png",
    "assets/images/girafa.png",
    "assets/images/macaco.png",
    "assets/images/leao.png",
    "assets/images/macaco.png",
    "assets/images/leao.png",
    "assets/images/cachorro.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> cartasIguais = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
