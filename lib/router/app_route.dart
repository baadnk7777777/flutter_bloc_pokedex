// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_complete/data/repositories/services/api_client.dart';
import 'package:flutter_pokemon_complete/modules/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_pokemon_complete/modules/home_page/repositories/impl/pokemon_repo_impl.dart';
import 'package:flutter_pokemon_complete/modules/home_page/views/home_page.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/bloc/pokemon_detail_bloc.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/repositories/impl/pokemon_detail_repo_impl.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/views/pokemon_detail_page.dart';
import 'package:nested/nested.dart';

class AppRouter {
  final HomePageBloc _homePageBloc = HomePageBloc(
    pokemonRepositoryImpl: PokemonRepositoryImpl(
      apiClient: APIClient(),
    ),
  );
  final PokemonDetailBloc _pokemonDetailBloc = PokemonDetailBloc(
    pokemonDetailRepositoryImpl: PokemonDetailRepositoryImpl(
      apiClient: APIClient(),
    ),
  );
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: <SingleChildWidget>[
              BlocProvider.value(
                value: _homePageBloc,
              ),
              BlocProvider.value(
                value: _pokemonDetailBloc,
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case '/pokemonDetailsScreen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _pokemonDetailBloc,
            child: const PokemonDetailScreen(),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    // close bloc.
  }
}
