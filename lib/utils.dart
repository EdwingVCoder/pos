import 'package:get/get.dart';
import 'package:pos/models/client_service.dart';
import 'package:pos/models/database/database_service.dart';
import 'package:pos/models/product_service.dart';

Future<void> registerDatabase() async {
  DatabaseService databaseService = await DatabaseService.create();
  Get.put(databaseService);
  Get.put(ProductService());
  Get.put(ClientService());
}
