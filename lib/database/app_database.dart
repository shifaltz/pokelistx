import 'package:path/path.dart';
import 'package:pokelistx/dao/treinadores_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'pokelist.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TreinadoresDao.tableSql);
  }, version: 2, onDowngrade: onDatabaseDowngradeDelete,);
}


