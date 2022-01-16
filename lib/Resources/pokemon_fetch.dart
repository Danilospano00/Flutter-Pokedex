import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/Pokemon/Model/pokemon_list_model.dart';


const String uri ='https://pokeapi.co/api/v2/pokemon';
class PokemonFetch {

  static Future<List<Pokemon>> fetchData() async {
    http.Response response =
        await http.get(Uri.parse(uri));
    if(response.statusCode==200){
     Map responseDecoded = jsonDecode(response.body);
     List<dynamic> pokemon = responseDecoded["results"];
     return pokemon.map((json) => Pokemon.fromJson(json)).toList();
    }
    else{
      throw Exception("Qualcosa è andato storto, ${response.statusCode}");
    }
  }


}
