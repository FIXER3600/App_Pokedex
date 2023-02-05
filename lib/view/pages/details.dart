import 'package:flutter/material.dart';
import 'package:pokedex/presenter/entities/data_entity.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DataEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text("${args.name}"),
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
                                '#${args.number}',
                              )),
                          Image.network('${args.thumbnailImage}')
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('${args.description}' == ""
                          ? 'Este Pokémon não apresenta nenhuma descrição'
                          : '${args.description}'),
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
                          for (var e in args.types!) Text(e.padRight(8)),
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
                          for (var e in args.weakness!) Text(e.padRight(8))
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
