import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/api/pokemon_api.dart';
import '../model/pokemon_class.dart';

class PokemonPresenter extends ChangeNotifier {
  final PokemonApi _api;
  PokemonPresenter(this._api);
  List<Pokemon> pokeList = [];
  bool loading = true;

  void pokemonData() async {
    List<Pokemon> list = await _api.getPokemons();
    pokeList = list;
    loading = false;
    notifyListeners();
  }
}
