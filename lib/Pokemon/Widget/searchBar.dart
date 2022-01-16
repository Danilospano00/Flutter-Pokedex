import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/Pokemon/pokemon_list_controller.dart';
import 'package:pokemon/Pokemon/pokemon_list_view.dart';
import 'package:search_page/search_page.dart';

import '../Model/pokemon_list_model.dart';

class SearchBar extends StatelessWidget {
  var pokemonController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.search,
        ),
      ),
      onTap: () => showSearch(
        context: context,
        delegate: SearchPage<Pokemon>(
          items: pokemonController.pokemonList,
          searchLabel: "Cerca Pokemon",
          failure: const Center(
            child: Text("Nessun pokemon trovato"),
          ),
          filter: (pokemon) => [
            pokemon.name,
          ],
          builder: (pokemon) => ListTile(
            title: Text(pokemon.name!),
          ),
        ),
      ),
    );
  }
}
