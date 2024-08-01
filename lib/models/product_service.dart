import 'package:get/get.dart';
import 'package:pos/models/database/database_service.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/objectbox.g.dart';

class ProductService {
  final DatabaseService databaseService = Get.find();
  late Box<Product> box;
  late Query<Product> searchQuery;

  ProductService() {
    box = databaseService.store.box<Product>();
    searchQuery = box
        .query(Product_.code
            .contains('')
            .or(Product_.name.contains('', caseSensitive: false)))
        .build();
  }

  void put(Product product) {
    box.put(product);
  }

  Product? get(int id) {
    return box.get(id);
  }

  List<Product> getAll() {
    return box.getAll();
  }

  void remove(int id) {
    box.remove(id);
  }

  List<Product> search(String value) {
    searchQuery.param(Product_.code).value = value;
    searchQuery.param(Product_.name).value = value;
    return searchQuery.find();
  }
}
