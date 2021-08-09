import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokelistx/models/pokemon.dart';
import 'package:pokelistx/models/treinador.dart';
import 'package:pokelistx/widgets/grid_fav_pokemon.dart';
import 'package:pokelistx/widgets/grid_pokemon.dart';

class ListaFavPokemons extends StatefulWidget {

  final Treinador _treinador;

  ListaFavPokemons(this._treinador);

  @override
  _ListaFavPokemonsState createState() => _ListaFavPokemonsState();

}

class _ListaFavPokemonsState extends State<ListaFavPokemons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Favdex', style: TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              return ListaFavPokemonCard(
                pokemons: snaphot.data, treinador: widget._treinador,);
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
    return data.map((json) => Pokemon.fromJson(json)).toList();
  }
}

class ListaFavPokemonCard extends StatelessWidget {
  final List<Pokemon> pokemons;
  final Treinador treinador;

  ListaFavPokemonCard({this.pokemons, this.treinador});

  @override
  Widget build(BuildContext context) {
    Iterable<Pokemon> pokemon = pokemons.where((element) =>
        element.name.contains(treinador.favPokemon));
    Pokemon pokemonFav = pokemon.first;
    String tipoPokemon = pokemonFav.type[0];
    Widget returnFav = GridFavPokemon(pokemon: pokemonFav,);

    return Container(
      color:  tipoPokemon == 'Grass' ? Colors.green :
      tipoPokemon == 'Fire' ? Colors.red :
      tipoPokemon == 'Water' ? Colors.blue :
      tipoPokemon == 'Electric' ? Colors.yellow :
      tipoPokemon == 'Rock' ? Colors.grey :
      tipoPokemon == 'Ground' ? Colors.brown :
      tipoPokemon == 'Psychic' ? Colors.indigo :
      tipoPokemon == 'Fighting' ? Colors.orange :
      tipoPokemon == 'Bug' ? Colors.lightGreen :
      tipoPokemon == 'Ghost' ? Colors.deepPurple :
      tipoPokemon == 'Normal' ? Colors.black26 :
      tipoPokemon == 'Poison' ? Colors.deepPurpleAccent :
      tipoPokemon == 'Ice' ? Colors.lightBlueAccent :
      tipoPokemon == 'Dragon' ? Colors.deepPurple[300] : Colors.pink,
      child: returnFav,
    );
  }
}
