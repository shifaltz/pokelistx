import 'package:flutter/cupertino.dart';
import 'package:pokelistx/database/app_database.dart';
import 'package:pokelistx/models/pokemon.dart';
import 'package:pokelistx/models/treinador.dart';
import 'package:sqflite/sqflite.dart';

class TreinadoresDao{

  static const String _tableName = 'treinadores';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _cidade = 'cidade';
  static const String _starterPokemon = 'starter_pokemon';
  static const String _favPokemon = 'fav_pokemon';

  static const String tableSql =
      'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY,'
      '$_nome TEXT,'
      '$_cidade TEXT,'
      '$_starterPokemon TEXT,'
      '$_favPokemon TEXT)';

  Future<int> saveTreinador(Treinador treinador) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> treinadorMap = Map();
    treinadorMap[_nome] = treinador.nome;
    treinadorMap[_cidade] = treinador.cidade;
    treinadorMap[_starterPokemon] = treinador.starterPokemon;
    treinadorMap[_favPokemon] = treinador.favPokemon;
    return db.insert(_tableName, treinadorMap);
  }

  Future<int> addFavPokemon(String name, int idTreinador) async {
    final Database db = await getDatabase();
    int updateFavPokemon = await db.rawUpdate(''
        'UPDATE $_tableName SET $_favPokemon = ? WHERE $_id = ?',[name, idTreinador]);
  }

  Future<List<Treinador>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Treinador> treinadores = [];
    for (Map<String, dynamic> row in result) {
      final Treinador treinador = Treinador(
        row[_id],
        row[_nome],
        row[_cidade],
        row[_starterPokemon],
        row[_favPokemon],
      );
      treinadores.add(treinador);
    }
    return treinadores;
  }
}