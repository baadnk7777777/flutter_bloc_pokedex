part of 'pokemon_detail_bloc.dart';

class PokemonDetailState extends Equatable {
  PokemonDetailState({
    PokemonCharacter? pokemonCharacter,
    this.status = StateStatus.initial,
  }) : pokemonCharacter = pokemonCharacter ?? PokemonCharacter();
  final PokemonCharacter pokemonCharacter;
  final StateStatus status;

  PokemonDetailState copyWith({
    PokemonCharacter? pokemonCharacter,
    StateStatus? status,
  }) =>
      PokemonDetailState(
        pokemonCharacter: pokemonCharacter ?? this.pokemonCharacter,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [pokemonCharacter, status];
}
