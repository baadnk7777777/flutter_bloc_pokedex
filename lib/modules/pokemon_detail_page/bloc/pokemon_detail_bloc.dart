// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/models/pokemon_charactor.dart';
import "package:flutter_pokemon_complete/modules/pokemon_detail_page/repositories/impl/pokemon_detail_repo_impl.dart";

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonDetailRepositoryImpl pokemonDetailRepositoryImpl;
  PokemonDetailBloc({required this.pokemonDetailRepositoryImpl})
      : super(PokemonDetailState()) {
    on<GetPokemonByNameEvent>(_onGetPokemonByNameEvent);
  }

  Future<void> _onGetPokemonByNameEvent(
    GetPokemonByNameEvent event,
    Emitter<PokemonDetailState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final Either<String, PokemonCharacter> result =
        await pokemonDetailRepositoryImpl.getPokemonByName(event.pokemonName);
    result.fold(
        (left) => emit(
              state.copyWith(status: StateStatus.failure),
            ),
        (right) => emit(
              state.copyWith(
                  status: StateStatus.success, pokemonCharacter: right),
            ));
  }
}
