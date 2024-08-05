import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:sqflite/sqflite.dart';

class LocalProductDB {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  Future _initDB() async {
    return await openDatabase(
      'product.db',
      version: 1,
      onCreate: (database, version) => onCreate(database, version),
    );
  }

  Future onCreate(Database database, int version) async {
    await database.execute(
      'CREATE TABLE ProductTable (id INTEGER PRIMARY KEY, name TEXT, description TEXT, created_at TEXT, updated_at TEXT, category TEXT, photo_url TEXT, price INTEGER)',
    );
  }

  Future<void> insertIntoDB(ProductsResponse products) async {
    final db = await database;
    Batch batch = db.batch();
    for (var product in products.products) {
      batch.insert("ProductTable", product.toJson());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> getAllProductsFromDB() async {
    final db = await database;

    return await db.rawQuery('SELECT * FROM ProductTable');
  }

  Future<void> deleteAllProductsFromDB() async {
    final db = await database;
    await db.delete('ProductTable');
  }
}
