part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetAllPokemonEvent extends HomePageEvent {
  const GetAllPokemonEvent();
}

class SearchPokemonEvent extends HomePageEvent {
  final String pokemonName;
  final List<Pokemons> tempPokemonLists;
  const SearchPokemonEvent(this.pokemonName, this.tempPokemonLists);
}
