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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.pokemon != null) {
      data['results'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
