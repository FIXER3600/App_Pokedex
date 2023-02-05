import 'package:flutter/material.dart';
import 'package:pokedex/presenter/data_presenter.dart';
import 'package:pokedex/presenter/entities/data_entity.dart';

class PokemonListPage extends StatefulWidget {
  final DataPresenter dataPresenter;
  const PokemonListPage(this.dataPresenter, {Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List<DataEntity> pokeList = [];
  bool loading = true;
  @override
  void initState() {
    widget.dataPresenter.pokemonData().then((value) {
      pokeList = value;
      setState(() {
        loading = false;
      });
    });

    super.initState();
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
      body: loading == false
          ? ListView.builder(
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
