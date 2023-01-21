import 'package:flutter/material.dart';
import 'package:pokedex/details.dart';
import 'package:pokedex/pokemon_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'list',
      routes: {
        'list': (context) => const PokemonListPage(),
        'details': (context) => const DetailsPage(),
      },
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
