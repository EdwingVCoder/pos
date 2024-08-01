import 'package:get/get.dart';
import 'package:pos/models/database/database_service.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/objectbox.g.dart';

class BillingService {
  final DatabaseService databaseService = Get.find();
  late Box<Bill> box;
  late Query<Bill> searchQuery;

  BillingService() {
    box = databaseService.store.box<Bill>();
    searchQuery = box.query().build();
  }

  void put(Bill bill) {
    box.put(bill);
  }

  Bill? get(int id) {
    return box.get(id);
  }

  List<Bill> getAll() {
    return box.getAll();
  }

  void remove(int id) {
    box.remove(id);
  }

  List<Bill> search(String value) {
    return searchQuery.find();
  }
}
