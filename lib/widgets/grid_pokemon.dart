import 'package:flutter/material.dart';
import 'package:pokelistx/dao/treinadores_dao.dart';
import 'package:pokelistx/models/pokemon.dart';
import 'package:pokelistx/models/treinador.dart';
import 'package:pokelistx/screens/book_treinador.dart';
import 'package:pokelistx/screens/list_fav_pokemons.dart';
import 'package:pokelistx/screens/list_treinadores.dart';

class GridPokemon extends StatefulWidget {

  final Pokemon pokemon;
  final Treinador treinador;

  GridPokemon({this.pokemon, this.treinador});

  @override
  _GridPokemonState createState() => _GridPokemonState();
}

class _GridPokemonState extends State<GridPokemon> {
  @override
  Widget build(BuildContext context) {
    final String nomePokemon = widget.pokemon.name;
    final String tipoPokemon = widget.pokemon.type[0];
    final String imagemPokemon = widget.pokemon.image;

    final TreinadoresDao _dao = TreinadoresDao();

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
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
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -10,
                right: -15,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    height: 110,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Text(
                  nomePokemon,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Text(
                      tipoPokemon.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black26,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Image.network(
                  imagemPokemon,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(nomePokemon),
            content:
                Text('Deseja adicionar ' + nomePokemon + ' na sua FavDex?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('Não')),
              TextButton(
                  onPressed: () {
                    _dao.addFavPokemon(widget.pokemon.name, widget.treinador.id).then((value) => Navigator.of(context).popUntil((route) => route.isFirst));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListaTreinadores()));
                  },
                  child: Text('Sim'))
            ],
          ),
        );
      },  
    );
  }
}
