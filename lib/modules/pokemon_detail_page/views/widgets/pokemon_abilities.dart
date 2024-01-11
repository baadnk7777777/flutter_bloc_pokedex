import 'package:flutter/material.dart';

class PokemonAbiliities extends StatelessWidget {
  final String title;
  final bool types;
  const PokemonAbiliities(
      {super.key, required this.title, required this.types});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: types ? Colors.orangeAccent : Colors.redAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        child: Text(
          title,
          style: TextStyle(
            color: types ? Colors.black54 : Colors.white70,
            fontFamily: 'poppins',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
