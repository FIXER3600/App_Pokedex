import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pokemon_presenter.dart';
import 'package:pokedex/view/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  void initState() {
    context.read<PokemonPresenter>().pokemonData();
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
        body: Consumer<PokemonPresenter>(
          builder: (context, value, child) {
            return Stack(children: [
              ListView.builder(
                itemCount: value.pokeList.length,
                itemBuilder: ((context, index) => value.pokeList.isEmpty
                    ? const Text('Lista vazia')
                    : Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: PokemonCard(pokemon: value.pokeList[index]),
                      )),
              ),
              if (value.loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ]);
          },
        ));
  }
}
