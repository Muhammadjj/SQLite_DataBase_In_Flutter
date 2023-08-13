// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/CONSTANT/product_db_provider.dart';

class DataBaseHelperClass {
  static Database? _database;
  static const String dataBaseName = "product.db";
  static const int dataBaseVersion = 4;
  static Future<Database> get databases async {
    ///* (getDatabasesPath) as laya use hota ha q ka as app ma jo bhi data
    ///* (CRUD) operation sa get ho ga wo data app ma store krwany ka laya
    ///*(getDatabasesPath) asy use krty ha ya ak trha sa dataBase ki location ha.
    String directoryPath = await getDatabasesPath();

    ///* ab hm na apny (CRUD) operation sa aya howa data ko js jaga save
    ///* krwana ha asy koi (name) dy ga ase waja sa hm ny (join function)
    ///* ko use kya ha
    ///* What is join? join function table bnany ka km nhi ata blka {join path}
    ///* ko handle krta ha . join function real ma two thing ko combine krny ka
    ///* laya use hota haa
    String path = join( directoryPath, dataBaseName,);
    return _database ??
        await openDatabase(
          path,
          version: dataBaseVersion,
          onCreate: (Database db, int version) {
            db.execute(ProductDB.createTable);
          },
        );
  }
}
