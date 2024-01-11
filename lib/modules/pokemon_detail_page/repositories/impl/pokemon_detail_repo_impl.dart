import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_complete/data/repositories/services/api_client.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/models/pokemon_charactor.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/repositories/pokemon_detail_repo.dart';

class PokemonDetailRepositoryImpl implements PokemonDetailRepository {
  final APIClient apiClient;

  PokemonDetailRepositoryImpl({required this.apiClient});
  @override
  Future<Either<String, PokemonCharacter>> getPokemonByName(
      String pokemonName) async {
    try {
      final response = await apiClient.getPokemonByName(pokemonName);
      if (response != null) {
        print(response);
        return Right(response);
      } else {
        return const Left("Not found");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
