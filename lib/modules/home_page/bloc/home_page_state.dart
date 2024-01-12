part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  HomePageState({
    this.pokemonList = const <Pokemons>[],
    this.status = StateStatus.initial,
    PokemonResponse? pokemonResponse,
  }) : pokemonResponse = pokemonResponse ??
            PokemonResponse(
              count: null,
              next: null,
              previous: null,
              pokemon: const <Pokemons>[],
            );

  final List<Pokemons> pokemonList;
  final StateStatus status;
  final PokemonResponse pokemonResponse;

  HomePageState copyWith({
    List<Pokemons>? pokemonList,
    StateStatus? status,
    PokemonResponse? pokemonResponse,
  }) =>
      HomePageState(
        pokemonList: pokemonList ?? this.pokemonList,
        status: status ?? this.status,
        pokemonResponse: pokemonResponse ?? this.pokemonResponse,
      );

  @override
  List<Object?> get props => <Object?>[pokemonList, status, pokemonResponse];
}
