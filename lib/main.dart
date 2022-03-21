import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/pages/jogo_da_memoria_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: JogoDaMemoria(),
    );
  }
}
