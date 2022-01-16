// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      name: json['name'] as String?,
      sprites: json['sprites'] as Map<String, dynamic>?,
      id: json['id'] as int?,
      baseExperience: json['baseExperience'] as int?,
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sprites': instance.sprites,
      'id': instance.id,
      'baseExperience': instance.baseExperience,
    };
