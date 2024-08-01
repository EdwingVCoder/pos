import 'package:get/get.dart';
import 'package:pos/models/database/database_service.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/objectbox.g.dart';

class ClientService {
  final DatabaseService databaseService = Get.find();
  late Box<Client> box;
  late Query<Client> searchQuery;

  ClientService() {
    box = databaseService.store.box<Client>();
    searchQuery = box
        .query(Client_.name
            .contains('', caseSensitive: false)
            .or(Client_.phone.contains('')))
        .build();
  }

  void put(Client client) {
    box.put(client);
  }

  Client? get(int id) {
    return box.get(id);
  }

  List<Client> getAll() {
    return box.getAll();
  }

  void remove(int id) {
    box.remove(id);
  }

  List<Client> search(String value) {
    searchQuery.param(Client_.phone).value = value;
    searchQuery.param(Client_.name).value = value;
    return searchQuery.find();
  }
}
