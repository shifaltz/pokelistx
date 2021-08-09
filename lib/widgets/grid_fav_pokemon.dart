import 'package:flutter/material.dart';
import 'package:pokelistx/models/pokemon.dart';

class GridFavPokemon extends StatefulWidget {
  final Pokemon pokemon;

  GridFavPokemon({this.pokemon});

  @override
  _GridFavPokemonState createState() => _GridFavPokemonState();
}

class _GridFavPokemonState extends State<GridFavPokemon> {
  @override
  Widget build(BuildContext context) {
    final String nomePokemon = widget.pokemon.name;
    final String tipoPokemon = widget.pokemon.type[0];
    final String imagemPokemon = widget.pokemon.image;

    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  nomePokemon,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Text('Altura: ' + widget.pokemon.height),
                Text('Peso: ' + widget.pokemon.weight),
                Text('Tipos'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                        backgroundColor: Colors.amber,
                        label: Text(widget.pokemon.type[0]),
                        onSelected: (b) {}),
                  ],
                ),
                Text('Fraquezas'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                        backgroundColor: Colors.amber,
                        label: Text(
                          widget.pokemon.weaknesses[0],
                        ),
                        onSelected: (b) {}),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: imagemPokemon,
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(imagemPokemon),
                )
              ),
            ),
          ),
        )
      ],
    );

    // return InkWell(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: tipoPokemon == 'Grass'
    //             ? Colors.green
    //             : tipoPokemon == 'Fire'
    //             ? Colors.red
    //             : tipoPokemon == 'Water'
    //             ? Colors.blue
    //             : tipoPokemon == 'Electric'
    //             ? Colors.yellow
    //             : tipoPokemon == 'Rock'
    //             ? Colors.grey
    //             : tipoPokemon == 'Ground'
    //             ? Colors.brown
    //             : tipoPokemon == 'Psychic'
    //             ? Colors.indigo
    //             : tipoPokemon == 'Fighting'
    //             ? Colors.orange
    //             : tipoPokemon == 'Bug'
    //             ? Colors.lightGreen
    //             : tipoPokemon == 'Ghost'
    //             ? Colors.deepPurple
    //             : tipoPokemon == 'Normal'
    //             ? Colors.black26
    //             : tipoPokemon ==
    //             'Poison'
    //             ? Colors
    //             .deepPurpleAccent
    //             : tipoPokemon ==
    //             'Ice'
    //             ? Colors
    //             .lightBlueAccent
    //             : tipoPokemon ==
    //             'Dragon'
    //             ? Colors.deepPurple[
    //         300]
    //             : Colors
    //             .pink,
    //         borderRadius: BorderRadius.all(Radius.circular(20)),
    //       ),
    //       child: Stack(
    //         children: [
    //           Positioned(
    //             bottom: -10,
    //             right: -15,
    //             child: Opacity(
    //               opacity: 0.5,
    //               child: Image.asset(
    //                 'assets/images/pokeball.png',
    //                 height: 110,
    //                 fit: BoxFit.fitHeight,
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 20,
    //             left: 10,
    //             child: Text(
    //               nomePokemon,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 18,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 50,
    //             left: 20,
    //             child: Container(
    //               child: Padding(
    //                 padding: const EdgeInsets.only(
    //                     left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
    //                 child: Text(
    //                   tipoPokemon.toString(),
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.all(Radius.circular(20)),
    //                 color: Colors.black26,
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             bottom: 5,
    //             right: 5,
    //             child: Image.network(
    //               imagemPokemon,
    //               height: 100,
    //               fit: BoxFit.fitHeight,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
