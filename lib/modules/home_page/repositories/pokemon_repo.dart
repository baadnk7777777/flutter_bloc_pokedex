import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<String, List<Pokemons>>> getAllPokemon();

  Future<Either<String, List<Pokemons>>> getAllPokemonListsByName(
      String pokemonName);
}
