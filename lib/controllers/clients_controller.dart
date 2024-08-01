import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/client_service.dart';
import 'package:pos/models/database/models.dart';

class ClientsController extends GetxController {
  final ClientService clientService = Get.find();

  RxList<Client> clients = <Client>[].obs;

  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final hoodController = TextEditingController();

  final searchController = TextEditingController();

  @override
  void onInit() {
    get();
    super.onInit();
  }

  void clear() {
    phoneController.clear();
    nameController.clear();
    addressController.clear();
    hoodController.clear();
  }

  void setData(Client client) {
    phoneController.text = client.phone;
    nameController.text = client.name;
    addressController.text = client.address;
    hoodController.text = client.hood;
  }

  bool checkData() {
    bool isFieldEmpty = phoneController.text.isEmpty ||
        nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        hoodController.text.isEmpty;

    if (isFieldEmpty) {
      return false;
    }

    bool isFieldValid = int.tryParse(phoneController.text) != null;

    return isFieldValid;
  }

  bool clientExists() {
    if (clientService.search(phoneController.text).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void search() {
    if (searchController.text.isEmpty) {
      get();
    } else {
      clients.value = clientService.search(searchController.text);
    }
  }

  void put({Client? client}) {
    client ??= Client();
    client
      ..phone = phoneController.text
      ..name = nameController.text
      ..address = addressController.text
      ..hood = hoodController.text;
    clientService.put(client);
    get();
  }

  void get() {
    clients.value = clientService.getAll();
  }

  void remove(int id) {
    clientService.remove(id);
    get();
  }
}
