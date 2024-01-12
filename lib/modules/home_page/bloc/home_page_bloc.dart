import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon_response.dart';
import 'package:flutter_pokemon_complete/modules/home_page/repositories/impl/pokemon_repo_impl.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final PokemonRepositoryImpl pokemonRepositoryImpl;
  HomePageBloc({required this.pokemonRepositoryImpl}) : super(HomePageState()) {
    on<GetAllPokemonEvent>(_onGetAllPokemon);
  }

  Future<void> _onGetAllPokemon(
      GetAllPokemonEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));

    final Either<String, List<Pokemons>> result =
        await pokemonRepositoryImpl.getAllPokemon();
    result.fold(
        (String left) => emit(
              state.copyWith(status: StateStatus.failure, pokemonList: <Pokemons>[]),
            ),
        (List<Pokemons> right) => emit(
              state.copyWith(status: StateStatus.success, pokemonList: right),
            ));
  }
}
