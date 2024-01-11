import 'package:flutter/material.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/models/pokemon_charactor.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/views/widgets/pokemon_abilities.dart';

class PokemonDetailCard extends StatelessWidget {
  final PokemonCharacter pokemonCharacter;
  const PokemonDetailCard({super.key, required this.pokemonCharacter});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              top: 50,
              bottom: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    pokemonCharacter.name ?? "No name",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Pokemon Details",
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pokemonCharacter.id != null
                          ? PokemonAbiliities(
                              title:
                                  'Pokemon Id: ${pokemonCharacter.height.toString()}',
                              types: true)
                          : const SizedBox.shrink(),
                      pokemonCharacter.height != null
                          ? PokemonAbiliities(
                              title:
                                  'Pokemon Height: ${pokemonCharacter.height.toString()}',
                              types: true)
                          : const SizedBox.shrink(),
                    ],
                  ),
                  // const Text(
                  //   "Stats",
                  //   style: TextStyle(
                  //     color: Colors.black54,
                  //     fontFamily: 'poppins',
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     // TypePokemon(
                  //     //   title: "Stamina: ${pokemon['stats']['stamina']}",
                  //     //   types: false,
                  //     // ),
                  //     // TypePokemon(
                  //     //   title: "Attack: ${pokemon['stats']['attack']}",
                  //     //   types: false,
                  //     // ),
                  //     // TypePokemon(
                  //     //   title: "Defense: ${pokemon['stats']['defense']}",
                  //     //   types: false,
                  //     // ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Text(
                  //   "Has MegaEvolution",
                  //   style: TextStyle(
                  //     color: Colors.black54,
                  //     fontFamily: 'poppins',
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: pokemon['hasMegaEvolution']
                  //             ? Colors.greenAccent
                  //             : Colors.redAccent,
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             vertical: 3, horizontal: 6),
                  //         child: Text(
                  //           pokemon['hasMegaEvolution']
                  //               ? 'HasMegaEvolution'
                  //               : 'HasnotMegaEvolution',
                  //           style: const TextStyle(
                  //             color: Colors.white70,
                  //             fontFamily: 'poppins',
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 130,
          top: -10,
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonCharacter.id}.png',
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }
}
