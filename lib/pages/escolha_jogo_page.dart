import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/jogo%20da%20imitacao/pages/jogo_da_imitacao_page.dart';
import 'package:jogo_da_memoria/jogo%20da%20memoria/jogo_da_memoria_page.dart';

class EscolhaJogoPage extends StatelessWidget {
  const EscolhaJogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return JogoDaMemoriaPage();
                  }));
                },
                child: Text("Jogo da memória")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return JogoDaImitacaoPage();
                  }));
                },
                child: Text("Jogo da imitação")),
          ),
        ],
      ),
    );
  }
}
