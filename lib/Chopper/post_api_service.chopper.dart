// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PokemonApiService extends PokemonApiService {
  _$PokemonApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PokemonApiService;

  @override
  Future<Response<PokemonList>> fetchData() {
    final $url = 'https://pokeapi.co/api/v2/pokemon';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PokemonList, PokemonList>($request);
  }

  @override
  Future<Response<PokemonImage>> fetchPokemonImage(String name) {
    final $url = 'https://pokeapi.co/api/v2/pokemon/${name}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PokemonImage, PokemonImage>($request);
  }

  @override
  Future<Response<PokemonModel>> fetchDettaglioPokemon(String name) {
    final $url = 'https://pokeapi.co/api/v2/pokemon/${name}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PokemonModel, PokemonModel>($request);
  }
}
