import 'package:pokedex/model/data.dart';
import 'package:pokedex/presenter/entities/data_entity.dart';

class PokemonEntity {
  List<DataEntity>? pokemonList;
  PokemonEntity(
    List<Data>? data, {
    this.pokemonList,
  });
}
