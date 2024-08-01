import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/models/product_service.dart';

class ProductsController extends GetxController {
  final ProductService productService = Get.find();

  RxList<Product> products = <Product>[].obs;

  final codeController = TextEditingController();
  final nameController = TextEditingController();
  final buyPriceController = TextEditingController();
  final sellPriceController = TextEditingController();
  final stockController = TextEditingController();

  final searchController = TextEditingController();

  @override
  void onInit() {
    get();
    super.onInit();
  }

  void clear() {
    codeController.clear();
    nameController.clear();
    buyPriceController.clear();
    sellPriceController.clear();
    stockController.clear();
  }

  void setData(Product product) {
    codeController.text = product.code.toString();
    nameController.text = product.name;
    buyPriceController.text = product.buyPrice.toString();
    sellPriceController.text = product.sellPrice.toString();
    stockController.text = product.stock.toString();
  }

  bool checkData() {
    bool isFieldEmpty = codeController.text.isEmpty ||
        nameController.text.isEmpty ||
        buyPriceController.text.isEmpty ||
        sellPriceController.text.isEmpty ||
        stockController.text.isEmpty;

    if (isFieldEmpty) {
      return false;
    }

    bool isFieldValid = int.tryParse(codeController.text) != null &&
        int.tryParse(buyPriceController.text) != null &&
        int.tryParse(sellPriceController.text) != null &&
        int.tryParse(stockController.text) != null;

    return isFieldValid;
  }

  bool productExists() {
    if (productService.search(codeController.text).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void search() {
    if (searchController.text.isEmpty) {
      get();
    } else {
      products.value = productService.search(searchController.text);
    }
  }

  void put({Product? product}) {
    product ??= Product();
    product
      ..code = codeController.text
      ..name = nameController.text
      ..buyPrice = int.parse(buyPriceController.text)
      ..sellPrice = int.parse(sellPriceController.text)
      ..stock = int.parse(stockController.text);
    productService.put(product);
    get();
  }

  void get() {
    products.value = productService.getAll();
  }

  void remove(int id) {
    productService.remove(id);
    get();
  }
}
