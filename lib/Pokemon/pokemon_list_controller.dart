import 'package:chopper/chopper.dart';
import 'package:get/get.dart';
import 'package:pokemon/Pokemon/Model/pokemon_list_model.dart';
import 'package:pokemon/Resources/Models/pokemon_converter.dart';
import 'package:pokemon/Resources/Models/pokemon_image.dart';
import 'package:pokemon/PokemonDettaglio/Model/pokemon_model_converter.dart';
import 'package:pokemon/Resources/pokemon_fetch.dart';
import 'package:pokemon/Chopper/post_api_service.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var pokemonList = <Pokemon>[].obs;
  ChopperClient? chopper;


  @override
  void onInit() {
    fetchPokemon();
    chopper = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [PokemonApiService.create()],
      converter: JsonToTypeConverter(
          {PokemonImage: (jsonData) => PokemonImage.fromJson(jsonData)}),
    );
    super.onInit();
  }

  Future<RxList<Pokemon>> fetchPokemon() async {
    try {
      var pokemon = await PokemonFetch.fetchData();
      pokemonList.assignAll(pokemon);
      return pokemonList;
    } finally {
      isLoading(false);
    }
  }

}
