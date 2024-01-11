import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_complete/common/constants/app_constants.dart';
import 'package:flutter_pokemon_complete/modules/home_page/bloc/home_page_bloc.dart';
import 'package:flutter_pokemon_complete/modules/home_page/views/widgets/pokemon_card.dart';
import 'package:flutter_pokemon_complete/modules/home_page/views/widgets/pokemon_search_filed.dart';
import 'package:flutter_pokemon_complete/modules/splash_page/splash_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(const GetAllPokemonEvent());
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
        headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: const SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: toolbarHeight,
                expandedHeight: toolbarHeight,
                flexibleSpace: PokemonSearchField(),
                floating: true,
                pinned: false,
                snap: true,
                elevation: 0,
              ),
            ),
          ];
        },
        body: Expanded(
          child: BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              switch (state.status) {
                case StateStatus.loading:
                  return const Center(
                    child: LoadingPage(),
                  );
                case StateStatus.success:
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: state.pokemonList.length,
                    itemBuilder: (context, index) {
                      return PokemonCard(pokemon: state.pokemonList[index]);
                    },
                  );

                case StateStatus.failure:
                  return const Center(
                    child: Text('Can not find Pokemons'),
                  );

                default:
                  return Container();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomePageBloc>().add(const GetAllPokemonEvent());
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
