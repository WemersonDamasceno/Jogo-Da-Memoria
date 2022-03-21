import 'package:flutter/material.dart';

class CardGameWidget extends StatelessWidget {
  final bool isEscondida;
  final String pathImage;
  const CardGameWidget({
    Key? key,
    required this.isEscondida,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: isEscondida
                ? AssetImage("assets/images/hidden.png")
                : AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
