// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class CartDatabaseHelper {
//   static final CartDatabaseHelper instance = CartDatabaseHelper._init();
//   CartDatabaseHelper._init();

//   static const tableProducts = "products";
//   static const cartProducts = 'cart';
//   static Database? _database;




//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('cart.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

  
  
//   }

//   Future<void> addItemToCart(int productId, int quantity) async {
//     final db = await instance.database;
//     await db.insert('cart', {'productId': productId, 'quantity': quantity});
//   }

//   Future<void> removeItemFromCart(int id) async {
//     final db = await instance.database;
//     await db.delete('cart', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<void> updateCartItemQuantity(int id, int quantity) async {
//     final db = await instance.database;
//     await db.update('cart', {'quantity': quantity},
//         where: 'id = ?', whereArgs: [id]);
//   }

//   Future<List<Map<String, dynamic>>> loadCart() async {
//     final db = await instance.database;
//     return await db.query('cart');
//   }
// }
