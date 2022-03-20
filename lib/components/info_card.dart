import 'package:flutter/material.dart';

Widget info_card(String title, String info) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            info,
            style: const TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
