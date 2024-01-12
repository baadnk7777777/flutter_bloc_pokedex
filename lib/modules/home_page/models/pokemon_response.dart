import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';

class PokemonResponse {
  int? count;
  String? next;
  String? previous;
  List<Pokemons>? pokemon;

  PokemonResponse({this.count, this.next, this.previous, this.pokemon});

  PokemonResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      pokemon = <Pokemons>[];
      json['results'].forEach((v) {
        pokemon!.add(Pokemons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (pokemon != null) {
      data['results'] = pokemon!.map((Pokemons v) => v.toJson()).toList();
    }
    return data;
  }
}
