import 'package:sqflite/sqflite.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/CONSTANT/db_helper_product.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/product_model.dart';

class ProductDB {
  static const String productTableName = "Provider";
  static const String keyProductId = "productId";
  static const String productImage = "productImage";
  static const String productName = "productName";
  static const String productPrice = "productPrice";
  static const String createTable =
      "CREATE TABLE $productTableName($keyProductId INTEGER PRIMARY KEY AUTOINCREMENT, $productImage TEXT , $productName TEXT, $productPrice INTEGER )";


// Todo:  Insert function help this inserting this data .
  Future<bool> insertData({required Products products}) async {
    Database db = await DataBaseHelperClass.databases;
    int rowId = await db.insert(productTableName, products.toMap());
    return rowId == 1;
  }



// Todo: Fetching function means data ko view krwany ka method
  Future<List<Products>> fetchingData() async {
    Database db = await DataBaseHelperClass.databases;
    List<Map<String, dynamic>> data = await db.query(productTableName,);
    return data.map((e) => Products.fromMap(e)).toList();
  }


// Todo: delete function means apna insert data ko delete krny ka method.
  Future<bool> deleteData( int? productIds) async {
    Database db = await DataBaseHelperClass.databases;
    productIds = await db.delete("Provider", where: '$keyProductId = ?', whereArgs: [productIds]);
    return productIds >= 1;
  }



// Todo: update function means ka apny insert data ko update krny ka function .
  Future<bool> updateData({required Products products}) async {
    Database db = await DataBaseHelperClass.databases;
    int rowId = await db.update(productTableName, products.toMap(),
        where: "$productTableName = ? ", whereArgs: [products.productId]);
    return rowId == 1;
  }
}
