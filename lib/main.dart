import 'package:flutter/material.dart';
import 'package:pokelistx/dao/treinadores_dao.dart';
import 'package:pokelistx/models/treinador.dart';
import 'package:pokelistx/screens/list_treinadores.dart';

void main() {
  runApp(Pokelistx());
}

class Pokelistx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTreinadores(),
      ),
      //debugShowCheckedModeBanner = tira listra de debug no emulador
      debugShowCheckedModeBanner: false,
    );
  }
}
