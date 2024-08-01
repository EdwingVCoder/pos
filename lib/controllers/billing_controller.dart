import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/billing_service.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/models/product_service.dart';

class BillingController extends GetxController {
  final BillingService billingService = Get.find();

  RxList<Bill> bills = <Bill>[].obs;

  final clientController = TextEditingController();

  Map<Product, int> selectedProducts = {};
  Set<int> productsCache = {};

  final searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void clear() {
    clientController.clear();
    selectedProducts.clear();
    productsCache.clear();
  }

  Map<Product, int> productsMap(List<int> products) {
    final ProductService productService = Get.find();

    Map<Product, int> data = {};

    final Set<int> ids = products.toSet();

    for (int id in ids) {
      Product? product = productService.get(id);
      int count = 0;
      for (int productId in products) {
        if (productId == id) {
          count++;
        }
      }
      if (product != null) {
        data[product] = count;
      }
    }

    return data;
  }

  void setData(Bill bill) {
    clientController.text = bill.client.target!.name;
    selectedProducts = productsMap(bill.products);
    productsCache = bill.products.toSet();
  }
}
