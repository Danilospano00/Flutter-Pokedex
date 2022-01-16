import 'package:chopper/chopper.dart';
import 'package:pokemon/Resources/Models/pokemon_image.dart';
import 'package:pokemon/Resources/Models/pokemon_list.dart';
import 'package:pokemon/PokemonDettaglio/Model/pokemon_model_converter.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: 'https://pokeapi.co/api/v2')
abstract class PokemonApiService extends ChopperService {

  @Get(path: '/pokemon')
  Future<Response<PokemonList>> fetchData();

  @Get(path: '/pokemon/{name}')
  Future<Response<PokemonImage>> fetchPokemonImage(@Path() String name);

  @Get(path: '/pokemon/{name}')
  Future<Response<PokemonModel>> fetchDettaglioPokemon(@Path() String name);

  static PokemonApiService create([ChopperClient? client]) =>
      _$PokemonApiService(client);
}
