import 'package:flutter/material.dart';

import '../../model/pokemon_class.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${pokemon.name}"),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '#${pokemon.number}',
                              )),
                          Image.network('${pokemon.thumbnailImage}')
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('${pokemon.description}' == ""
                          ? 'Este Pokémon não apresenta nenhuma descrição'
                          : '${pokemon.description}'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Tipo:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [
                          for (var e in pokemon.types!) Text(e.padRight(8)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Fraquezas:',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Row(
                        children: [
                          for (var e in pokemon.weakness!) Text(e.padRight(8))
                        ],
                      )
                    ],
                  ),
                )
              ]),
            )),
          )
        ],
      )),
    );
  }
}
