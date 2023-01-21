import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'data.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List<Data> pokeList = [];
  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  void getPokemons() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          Map json = const JsonDecoder().convert(value.body);
          for (var element in (json['data'] as List)) {
            pokeList.add(Data.fromJson(element));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex'), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            './assets/pokeball.png',
            height: 30,
            width: 30,
          ),
        ),
      ]),
      body: ListView.builder(
        itemCount: pokeList.length,
        itemBuilder: ((context, index) => pokeList.isEmpty
            ? const Text('Lista vazia')
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      leading: Image.network(
                          pokeList[index].thumbnailImage.toString()),
                      title: Text('${pokeList[index].name}'),
                      trailing: Text(
                        '#${pokeList[index].number}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'details',
                            arguments: pokeList[index]);
                      }),
                )),
              )),
      ),
    );
  }
}
