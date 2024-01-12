import 'package:flutter/material.dart';

class PokemonSearchField extends StatelessWidget {
  const PokemonSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25.0,
      ),
      child: Container(
        color: Colors.blue,
        child: Opacity(
          opacity: 1,
          child: Stack(
            children: <Widget>[
              const Positioned(
                  bottom: 50,
                  left: 18,
                  right: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Pokédex",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: -25.0,
                left: 14.0,
                right: 14.0,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 17.5, horizontal: 20),
                          hintText: "Search...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // child: TextField(
        //   onChanged: (value) {
        //     // final bloc = context.read<PokemonBloc>();
        //     // if (bloc.state is PokemonFinishState) {
        //     //   final state = bloc.state as PokemonFinishState;
        //     //   state.pokemonList
        //     //       .where((element) =>
        //     //           element['names']['English'].toString().toLowerCase() ==
        //     //           value.toLowerCase())
        //     //       .forEach((filteredPokemon) {
        //     //     bloc.add(
        //     //       FindPokemonEvent(
        //     //         found: true,
        //     //         pokemonName: filteredPokemon['dexNr'].toString(),
        //     //       ),
        //     //     );
        //     //   });
        //     // }
        //     // if (value == '' || value.isEmpty) {
        //     //   bloc.add(
        //     //     FindPokemonEvent(
        //     //       found: false,
        //     //       pokemonName: '0',
        //     //     ),
        //     //   );
        //     // }
        //   },
        //   style: const TextStyle(
        //     fontSize: 18.0,
        //     fontFamily: 'poppins',
        //   ),
        //   decoration: InputDecoration(
        //     suffixIcon: InkWell(
        //       onTap: () {
        //         print("Searching");
        //       },
        //       child: const Icon(
        //         CupertinoIcons.search,
        //       ),
        //     ),
        //     border: InputBorder.none,
        //     contentPadding:
        //         const EdgeInsets.symmetric(vertical: 17.5, horizontal: 20),
        //     hintText: "Search...",
        //     hintStyle: const TextStyle(
        //       fontSize: 18.0,
        //       fontFamily: 'poppins',
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
