import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon_class.dart';
import 'dart:convert';

class PokemonApi {
  var client = http.Client();
  Future<List<Pokemon>> getPokemons() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      List<Pokemon> list = [];
      Map<String, dynamic> json = jsonDecode(response.body);
      for (var item in (json['data'] as List)) {
        list.add(Pokemon.fromJson(item));
      }
      return list;
    } else {
      return [];
    }
  }
}
