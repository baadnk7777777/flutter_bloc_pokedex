import 'dart:convert';

import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemonData.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon_response.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/models/pokemon_charactor.dart';
import 'package:http/http.dart' as http;

class APIClient {
  final String baseUrl;
  final http.Client _httpClient;

  APIClient({
    String? baseUrl,
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        baseUrl = baseUrl ?? pokemonBaseURL;

  Future<PokemonCharacter?> getPokemonByName(String pokemonName) async {
    try {
      final http.Response response = await _httpClient.get(
        Uri.parse('$baseUrl${PATHS.pokemon}/$pokemonName'),
      );
      if (response.statusCode == 200) {
        PokemonCharacter? result =
            PokemonCharacter.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<PokemonData> getAllPokemon() async {
    try {
      final http.Response response =
          await _httpClient.get(Uri.parse(baseUrl + PATHS.pokemon));
      await Future.delayed(const Duration(seconds: 1));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final PokemonResponse pokemonResponse = PokemonResponse.fromJson(jsonData);
        final List<Pokemons> pokemonList = (jsonData['results'] as List)
            .map((pokemonData) => Pokemons.fromJson(pokemonData))
            .toList();
        return PokemonData(response: pokemonResponse, pokemonList: pokemonList);
      }
      return PokemonData(response: null, pokemonList: <Pokemons>[]);
    } catch (e) {
      return PokemonData(response: null, pokemonList: <Pokemons>[]);
    }
  }
}
