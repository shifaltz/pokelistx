import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokelistx/models/treinador.dart';
import 'package:pokelistx/screens/list_pokemons.dart';

import 'list_fav_pokemons.dart';

class BookTreinador extends StatefulWidget {
  final Treinador _treinador;

  BookTreinador(this._treinador);

  @override
  _BookTreinadorState createState() => _BookTreinadorState();
}

class _BookTreinadorState extends State<BookTreinador> {
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
        title: Row(
          children: [
            Container(
              child: Text(widget._treinador.nome, style: TextStyle(color: Colors.black),),
            ),
            Spacer(),
            Image.asset(
              'assets/icons/icon_' + widget._treinador.starterPokemon + '.png',
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/back.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 250,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        left: -60,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/pokeball.png',
                            height: 200,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Pokedex',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ListaPokemons(widget._treinador)));
              },
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/background_pokemon.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 250,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        left: -60,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/heart_pokemon.png',
                            height: 200,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Favdex',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                debugPrint(widget._treinador.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ListaFavPokemons(widget._treinador)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
