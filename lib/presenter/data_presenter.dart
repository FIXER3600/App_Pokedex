import 'package:pokedex/model/api/pokemon_api.dart';
import '../model/pokemon_class.dart';
import 'entities/data_entity.dart';

class DataPresenter {
  final PokemonApi api = PokemonApi();

  Future<List<DataEntity>> pokemonData() async {
    final Pokemon res = await api.getPokemons();
    if (res.data == null) {
      return [];
    }
    return res.data!
        .map((e) => DataEntity(
            name: e.name,
            number: e.number,
            thumbnailImage: e.thumbnailImage,
            description: e.description,
            types: e.type,
            weakness: e.weakness))
        .toList();
  }
}
