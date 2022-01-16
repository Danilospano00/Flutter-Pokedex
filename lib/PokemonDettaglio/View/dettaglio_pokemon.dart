import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/PokemonDettaglio/Controller/pokemon_dettaglio_controller.dart';
import 'package:pokemon/PokemonDettaglio/View/Widget/WidgetView/popup.dart';

class DettaglioPokemon extends GetView<DettaglioPokemonController> {
  DettaglioPokemonController ctrl = Get.put(DettaglioPokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ctrl.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.dialog(ImagePopUp(),arguments:
                        [ctrl.pokemon.sprites],
                      ),
                      child: Center(
                          child: Image.network(
                        ctrl.pokemon.sprites!["front_default"],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nome: ${ctrl.pokemon.name!.toUpperCase()}"),
                          Text("Id: ${ctrl.pokemon.id}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
