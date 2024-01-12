import 'package:flutter/material.dart';
import 'package:flutter_pokemon_complete/modules/home_page/views/widgets/pokemon_search_filed.dart';

class customSliverOverlap extends StatelessWidget {
  const customSliverOverlap({super.key});

  @override
  Widget build(BuildContext context) {
    const double toolbarHeight = kToolbarHeight + 110;

    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        collapsedHeight: toolbarHeight,
        expandedHeight: toolbarHeight,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Container(
            color: Colors.white,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  bottom: 60,
                  left: 250,
                  right: 0,
                  child: Image.asset(
                    'images/pokeball.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const Positioned(
                  top: 0,
                  left: 14,
                  right: 14,
                  child: Text(
                    'Pokémon',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20.0,
                  left: 14.0,
                  right: 14.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: PokemonSearchField(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floating: false, // Set to false for non-floating behavior
        pinned: true, // Set to true for pinned behavior
        snap: false, // Set to false if you don't want snap behavior
        elevation: 0,
      ),
    );
  }
}
