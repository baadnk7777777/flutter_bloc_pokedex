// ignore_for_file: always_specify_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_pokemon_complete/modules/home_page/models/pokemon.dart';
import 'package:flutter_pokemon_complete/modules/home_page/views/widgets/pokemon_card.dart';
import 'package:flutter_pokemon_complete/modules/home_page/views/widgets/pokemon_Appbar.dart';
import 'package:flutter_pokemon_complete/modules/splash_page/splash_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Pokemons> pokemonLists = <Pokemons>[];
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    context.read<HomePageBloc>().add(GetAllPokemonEvent(_currentPage));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _currentPage += 1;
      });

      context.read<HomePageBloc>().add(GetAllPokemonEvent(_currentPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    const double toolbarHeight = kToolbarHeight + 110;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        clipBehavior: Clip.none,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: const SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: toolbarHeight,
                expandedHeight: toolbarHeight,
                flexibleSpace: PokemonAppbar(),
                floating: true,
                pinned: false,
                snap: true,
                elevation: 0,
              ),
            ),
          ];
        },
        body: Expanded(
          child: BlocConsumer<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state.status == StateStatus.loading &&
                  pokemonLists.isNotEmpty) {}
              if (state.status == StateStatus.success &&
                  pokemonLists.isEmpty &&
                  state.isSearchingStatus == StateStatus.initial) {
                return showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    message: "Pokemons loadings successfully",
                  ),
                );
              }
              if (state.status == StateStatus.failure && pokemonLists.isEmpty) {
                return showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message: "Something went wrong.",
                  ),
                );
              }
              return;
            },
            builder: (context, state) {
              if (state.status == StateStatus.initial ||
                  (state.status == StateStatus.loading &&
                      pokemonLists.isEmpty)) {
                return const LoadingPage();
              } else if (state.isSearchingStatus == StateStatus.loading) {
                _currentPage = 0;
              } else if (state.status == StateStatus.success &&
                  state.isSearchingStatus == StateStatus.success) {
                pokemonLists = state.pokemonList;
              } else if (state.status == StateStatus.failure &&
                  pokemonLists.isEmpty) {}
              return GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                itemCount: pokemonLists.length,
                itemBuilder: (BuildContext context, int index) {
                  return PokemonCard(
                    pokemon: pokemonLists[index],
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentPage = 0;
            pokemonLists.clear();
          });
          context.read<HomePageBloc>().add(GetAllPokemonEvent(_currentPage));
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          CupertinoIcons.refresh,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
