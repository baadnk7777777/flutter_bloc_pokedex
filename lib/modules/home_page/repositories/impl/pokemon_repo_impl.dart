// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_complete/data/repositories/services/api_client.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemonData.dart';
import 'package:flutter_pokemon_complete/modules/home_page/repositories/pokemon_repo.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/models/pokemon_charactor.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final APIClient apiClient;

  PokemonRepositoryImpl({required this.apiClient});

  @override
  Future<Either<String, List<Pokemons>>> getAllPokemonListsByName(
      String pokemonName) async {
    try {
      Future.delayed(
        const Duration(seconds: 2),
      );

      final PokemonCharacter? pokemonCharacter =
          await apiClient.getPokemonByName(pokemonName);
      List<Pokemons> pokemonLists = <Pokemons>[];

      if (pokemonCharacter != null) {
        Pokemons pokemon = Pokemons(
          name: pokemonCharacter.name,
          url: '${pokemonCharacter.id}',
          imageUrl: '${pokemonCharacter.id}',
        );
        pokemonLists.add(pokemon);
        return Right(pokemonLists);
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Pokemons>>> getAllPokemon(int currentPage) async {
    try {
      final PokemonData pokemonData =
          await apiClient.getAllPokemon(currentPage);
      if (pokemonData.pokemonList.isNotEmpty) {
        return Right(pokemonData.pokemonList);
      }
      return Right(pokemonData.pokemonList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
