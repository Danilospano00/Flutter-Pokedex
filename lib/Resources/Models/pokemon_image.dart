
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_image.g.dart';
@JsonSerializable()
class PokemonImage{
  Map<String, dynamic>? sprites;

  PokemonImage({required this.sprites});


  factory PokemonImage.fromJson(Map<String, dynamic> json) => _$PokemonImageFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonImageToJson(this);
}