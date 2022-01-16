import 'package:chopper/chopper.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pokemon/Chopper/post_api_service.dart';
import 'package:pokemon/Pokemon/pokemon_list_controller.dart';
import 'package:pokemon/Resources/Models/pokemon_converter.dart';
import 'package:pokemon/Resources/Models/pokemon_image.dart';

class WidgetPokemonImageController extends GetxController {
  String? name;

  WidgetPokemonImageController({required this.name});

  var pokemonImage;

  String? sprites;

  ChopperClient? chopper;

  var isLoading = true.obs;
  String? sprite;

  @override
  void onInit() {
    chopper = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [PokemonApiService.create()],
      converter: JsonToTypeConverter(
          {PokemonImage: (jsonData) => PokemonImage.fromJson(jsonData)}),
    );


    fetchPokemonImage(name!);

    super.onInit();
  }

  fetchPokemonImage(String nome) async {
    try {
      final pokemonService = chopper?.getService<PokemonApiService>();
      var response = await pokemonService?.fetchPokemonImage(nome);
      sprites = response!.body!.sprites!["front_default"];
      return sprites;
    } finally {
      isLoading(false);
    }
  }


}
