import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_model.g.dart';
@JsonSerializable()
class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);


}