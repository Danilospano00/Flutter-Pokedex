import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';


part 'pokemon_model_converter.g.dart';

@JsonSerializable()
class PokemonModel{

  String? name;
  Map<String, dynamic>? sprites;
  int? id;
  int? baseExperience;


  PokemonModel({required this.name,required this.sprites,required this.id,required this.baseExperience});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}