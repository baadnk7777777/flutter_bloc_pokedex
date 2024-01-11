part of 'pokemon_detail_bloc.dart';

sealed class PokemonDetailState extends Equatable {
  const PokemonDetailState();
  
  @override
  List<Object> get props => [];
}

final class PokemonDetailInitial extends PokemonDetailState {}
