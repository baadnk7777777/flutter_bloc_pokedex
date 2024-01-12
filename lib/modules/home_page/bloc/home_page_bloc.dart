// ignore_for_file: always_specify_types

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
    on<SearchPokemonEvent>(_onSearchPokemon);
  }

  Future<void> _onSearchPokemon(
      SearchPokemonEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
      isSearchingStatus: StateStatus.loading,
    ));
    final String tragetPokemon = event.pokemonName;
    final List<Pokemons> tempPokemonLists = event.tempPokemonLists;

    List<Pokemons> pokemonsFound = tempPokemonLists
        .where(
          (Pokemons pokemon) => pokemon.name!.contains(tragetPokemon),
        )
        .toList();

    if (pokemonsFound.isEmpty) {
      final Either<String, List<Pokemons>> result = await pokemonRepositoryImpl
          .getAllPokemonListsByName(event.pokemonName);
      result.fold(
        (String left) => emit(state.copyWith(
            status: StateStatus.failure,
            isSearchingStatus: StateStatus.failure,
            pokemonList: <Pokemons>[])),
        (List<Pokemons> right) => emit(state.copyWith(
            status: StateStatus.success,
            isSearchingStatus: StateStatus.success,
            pokemonList: right)),
      );
    } else {
      emit(
        state.copyWith(
          status: StateStatus.success,
          isSearchingStatus: StateStatus.success,
          pokemonList: pokemonsFound,
        ),
      );
    }
  }

  Future<void> _onGetAllPokemon(
      GetAllPokemonEvent event, Emitter<HomePageState> emit) async {
    if (event.currentPage == 0 && state.status != StateStatus.initial) {
      state.pokemonList.clear();
    }

    emit(state.copyWith(
      status: StateStatus.loading,
      isSearchingStatus: StateStatus.initial,
    ));
    final Either<String, List<Pokemons>> result =
        await pokemonRepositoryImpl.getAllPokemon(event.currentPage);
    result.fold(
        (String left) => emit(
              state.copyWith(
                  status: StateStatus.failure,
                  isSearchingStatus: StateStatus.failure,
                  pokemonList: <Pokemons>[]),
            ),
        (List<Pokemons> right) => emit(
              state.copyWith(
                  status: StateStatus.success,
                  isSearchingStatus: StateStatus.success,
                  pokemonList: List.from(state.pokemonList)..addAll(right)),
            ));
  }
}
