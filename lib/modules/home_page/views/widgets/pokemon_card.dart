import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/bloc/pokemon_detail_bloc.dart';

class PokemonCard extends StatelessWidget {
  final Pokemons pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/pokemonDetailsScreen',
            arguments: {'pokemonName': pokemon.name});
        context.read<PokemonDetailBloc>().add(
              GetPokemonByNameEvent(pokemon.name ?? 'unknown'),
            );
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Text(
                  pokemon.name ?? "Pokemon No Name",
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 50,
                child: Image.asset(
                  'images/pokeball.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                left: 90,
                top: 20,
                child: Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.imageUrl}.png",
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
