import 'package:flutter/material.dart';
import 'package:pokelistx/dao/treinadores_dao.dart';
import 'package:pokelistx/models/treinador.dart';
import 'package:pokelistx/screens/book_treinador.dart';
import 'package:pokelistx/screens/form_treinadores.dart';

class ListaTreinadores extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaTreinadoresState();
  }
}

class ListaTreinadoresState extends State<ListaTreinadores> {
  final TreinadoresDao _dao = TreinadoresDao();

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
        title: Text('Treinadores', style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: FutureBuilder(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('carregando'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Treinador> treinadores = snapshot.data;
              return ListView.builder(
                itemCount: treinadores.length,
                itemBuilder: (context, index) {
                  final Treinador treinador = treinadores[index];
                  return CardTreinador(treinador);
                },
              );
              break;
          }
          return Text('unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormTreinadores(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
      ),
    );
  }
}

class CardTreinador extends StatelessWidget {
  final Treinador _treinador;

  CardTreinador(this._treinador);

  @override
  Widget build(BuildContext context) {
    String starterPokemon = _treinador.starterPokemon;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: starterPokemon == 'Squirtle'
                ? Colors.blue[300]
                : starterPokemon == 'Charmander'
                    ? Colors.orange[300]
                    : starterPokemon == 'Bulbasaur'
                        ? Colors.green[300]
                        : Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _treinador.nome,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/icon_' + starterPokemon + '.png',
                          height: 56,
                          width: 56,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cidade - '),
                        Text(
                          _treinador.cidade,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookTreinador(_treinador),
          ),
        );
      },
    );
  }
}
