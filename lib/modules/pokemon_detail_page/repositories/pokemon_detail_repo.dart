import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/models/pokemon_charactor.dart';

abstract class PokemonDetailRepository {
  Future<Either<String, PokemonCharacter>> getPokemonByName(String pokemonName);
}
