import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/Pokemon/Widget/searchBar.dart';
import 'package:pokemon/Pokemon/pokemon_list_controller.dart';
import 'package:pokemon/PokemonDettaglio/View/dettaglio_pokemon.dart';
import 'package:pokemon/Resources/Models/pokemon_image.dart';

import 'Widget/PokemonImage/pokemon_image_controller.dart';
import 'Widget/PokemonImage/pokemon_image_view.dart';

class HomePage extends GetView<PokemonController> {
  var ctrl = Get.put(PokemonController());


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            SearchBar(),
          ],
        ),
        body: ctrl.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: ctrl.pokemonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Get.to(()=>
                      DettaglioPokemon(),
                      arguments: ctrl.pokemonList[index].name,
                    ),
                    child: Card(
                      child: Row(
                        children: [
                          WidgetPokemonImage(nome: ctrl.pokemonList[index].name,),
                          Spacer(),
                          Text(ctrl.pokemonList[index].name!),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
