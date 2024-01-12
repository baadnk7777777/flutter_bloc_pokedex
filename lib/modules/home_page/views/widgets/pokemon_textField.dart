import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';

class PokemonTextField extends StatefulWidget {
  const PokemonTextField({super.key});

  @override
  State<PokemonTextField> createState() => _PokemonTextFieldState();
}

class _PokemonTextFieldState extends State<PokemonTextField> {
  List<Pokemons> originalPokemonLists = <Pokemons>[];
  int fetchInitialCount = 0;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _getOriginalPokemonLists() async {
    HomePageState state = BlocProvider.of<HomePageBloc>(context).state;
    if (state.status == StateStatus.success) {
      setState(() {
        originalPokemonLists = state.pokemonList;
        fetchInitialCount = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) {
        if (fetchInitialCount != 1) {
          _getOriginalPokemonLists();
        }
        if (value.isNotEmpty) {
          context.read<HomePageBloc>().add(
                SearchPokemonEvent(
                  value,
                  originalPokemonLists,
                ),
              );
        } else {
          context.read<HomePageBloc>().add(
                const GetAllPokemonEvent(),
              );
        }
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 20),
        hintText: "Search...",
        border: InputBorder.none,
        hintStyle: TextStyle(
            color: Colors.black, fontSize: 18.0, fontFamily: 'Poppins'),
      ),
    );
  }
}
