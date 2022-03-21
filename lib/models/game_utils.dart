import 'package:jogo_da_memoria/models/carta_memoria_model.dart';

class Game {
  List<CartaMemoriaModel> listaDeCartas = [
    CartaMemoriaModel(
      pathImage: "assets/images/macaco.png",
      isEscondida: true,
      valor: "macaco",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/girafa.png",
      isEscondida: true,
      valor: "girafa",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/macaco.png",
      isEscondida: true,
      valor: "macaco",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/cachorro.png",
      isEscondida: true,
      valor: "cachorro",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/leao.png",
      isEscondida: true,
      valor: "leao",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/girafa.png",
      isEscondida: true,
      valor: "girafa",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/leao.png",
      isEscondida: true,
      valor: "leao",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/cachorro.png",
      isEscondida: true,
      valor: "cachorro",
    ),
  ];

  final int quantidadeCartas = 8;
  List<Map<int, CartaMemoriaModel>> cartasIguais = [];
}
