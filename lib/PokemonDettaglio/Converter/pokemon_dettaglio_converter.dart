
import 'package:chopper/chopper.dart';
import 'package:pokemon/PokemonDettaglio/Model/pokemon_model_converter.dart';

class PokemonModelConverter extends JsonConverter {

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
        body: PokemonModel.fromJson(super.convertResponse(response).body))
    as Response<BodyType>;
  }

}
