import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_complete/data/repositories/services/api_client.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemonData.dart';
import 'package:flutter_pokemon_complete/modules/home_page/repositories/pokemon_repo.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final APIClient apiClient;

  PokemonRepositoryImpl({required this.apiClient});

  @override
  Future<Either<String, List<Pokemons>>> getAllPokemon() async {
    try {
      final PokemonData pokemonData = await apiClient.getAllPokemon();
      if (pokemonData.pokemonList.isNotEmpty) {
        return Right(pokemonData.pokemonList);
      }
      return Right(pokemonData.pokemonList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
