part of 'pokemon_detail_bloc.dart';

@immutable
abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonByNameEvent extends PokemonDetailEvent {
  final String pokemonName;
  const GetPokemonByNameEvent(this.pokemonName);
}
