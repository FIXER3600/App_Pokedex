import 'package:flutter/material.dart';

import '../../model/pokemon_class.dart';
import '../pages/details.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
          return DetailsPage(pokemon: pokemon);
        })));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(pokemon.thumbnailImage.toString()),
          title: Text('${pokemon.name}'),
          trailing: Text(
            '#${pokemon.number}',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    ));
  }
}
