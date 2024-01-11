import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon_response.dart';

class PokemonData {
  final PokemonResponse? response;
  final List<Pokemons> pokemonList;

  PokemonData({required this.response, required this.pokemonList});
}
