import 'package:chopper/chopper.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pokemon/Pokemon/Model/pokemon_list_model.dart';
import 'package:pokemon/Resources/Models/pokemon_converter.dart';
import 'package:pokemon/PokemonDettaglio/Model/pokemon_model_converter.dart';
import 'package:pokemon/Chopper/post_api_service.dart';

class DettaglioPokemonController extends GetxController {
 late PokemonModel pokemon;
  var isLoading = true.obs;
  ChopperClient? chopper;

  getx.RxMap mapSprites = {}.obs;

  var name = getx.Get.arguments;

  @override
  void onInit() {
    chopper = getx.Get.put(ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [PokemonApiService.create()],
      converter: JsonToTypeConverter(
          {PokemonModel: (jsonData) => PokemonModel.fromJson(jsonData)}),
    ));
    fetchDettaglioPokemon(name).then((value) {
      pokemon = getx.Get.put(PokemonModel(name: value.name, sprites:  value.sprites, id: value.id, baseExperience: value.baseExperience));
    });
    super.onInit();
  }

  Future<PokemonModel> fetchDettaglioPokemon(String nome) async {
    try {
      final pokemonService = chopper?.getService<PokemonApiService>();
      var response = await pokemonService?.fetchDettaglioPokemon(nome);
      return response!.body!;
    } finally {
      isLoading(false);
    }
  }
}
