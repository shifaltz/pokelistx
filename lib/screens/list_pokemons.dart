import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokelistx/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokelistx/models/treinador.dart';
import 'package:pokelistx/widgets/grid_pokemon.dart';

class ListaPokemons extends StatefulWidget {

  final Treinador _treinador;

  ListaPokemons(this._treinador);

  @override
  _ListaPokemonsState createState() => _ListaPokemonsState();
}

class _ListaPokemonsState extends State<ListaPokemons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Pokedex', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: FutureBuilder(
        future: fetchPokemonsFromAPI(),
        builder: (context, snaphot) {
          switch (snaphot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return ListaPokemonCard(pokemons: snaphot.data, treinador: widget._treinador,);
              break;
          }
          return Text('erro desconhecido');
        },
      ),
    );
  }

  Future<List<Pokemon>> fetchPokemonsFromAPI() async {
    final response = await http.get(Uri.https('raw.githubusercontent.com',
        '/rsr-itminds/flutter-workshop/master/data/pokedex.json'));
    final List<dynamic> data = json.decode(response.body);
    // print(data);
    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}

class ListaPokemonCard extends StatelessWidget {
  final List<Pokemon> pokemons;
  final Treinador treinador;

  ListaPokemonCard({this.pokemons, this.treinador});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = pokemons.map((p) => GridPokemon(pokemon: p, treinador: treinador,)).toList();

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.4,
      children: list,
    );
  }
}
