import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/bloc/pokemon_detail_bloc.dart';
import 'package:flutter_pokemon_complete/modules/pokemon_detail_page/views/widgets/pokemon_detail_card.dart';
import 'package:flutter_pokemon_complete/modules/splash_page/splash_page.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<PokemonDetailBloc>().add(const GetPokemonByNameEvent());
  }

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic>? arguments =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // if (arguments != null) {
    //   final String pokemonName = arguments['pokemonName'];
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          builder: (BuildContext context, PokemonDetailState state) {
            return Text(
              state.pokemonCharacter.name ?? "No name",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          builder: (BuildContext context, PokemonDetailState state) {
        switch (state.status) {
          case StateStatus.loading:
            return const LoadingPage();

          case StateStatus.success:
            return PokemonDetailCard(
              pokemonCharacter: state.pokemonCharacter,
            );

          case StateStatus.failure:
            return const Center(
              child: Text('Sorry have a problem to fetch Pokemon details'),
            );
          default:
            return const Center(
              child: Text('Failed to fetch Pokemon details'),
            );
        }
      }),
    );
  }
}
