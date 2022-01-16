import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/Pokemon/Widget/PokemonImage/pokemon_image_controller.dart';

class WidgetPokemonImage extends GetWidget {
  String? nome;
  WidgetPokemonImage({required this.nome});



  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(WidgetPokemonImageController(name: nome!), tag: nome);
    return Obx(
      ()=> ctrl.isLoading.value?
          CircularProgressIndicator():
          Image.network(
        ctrl.sprites!,
      ),
    );
  }

}
