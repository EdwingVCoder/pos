import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/clients_controller.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/widgets/dialog.dart';
import 'package:pos/widgets/messages.dart';
import 'package:pos/widgets/page_layout.dart';
import 'package:pos/widgets/tiles/client_tile.dart';

class ClientsPage extends StatelessWidget {
  final ClientsController clientsController = Get.put(ClientsController());
  ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => PageLayout(
        data: getData(),
        createDialog: createDialog,
        searchController: clientsController.searchController,
        onSearch: clientsController.search));
  }

  List<Widget> getData() {
    return clientsController.clients.map(
      (Client client) {
        return ClientTile(
            client: client,
            editDialog: editDialog,
            onDelete: clientsController.remove,
            viewDialog: viewDialog);
      },
    ).toList();
  }

  void createDialog() {
    clientsController.clear();
    dataDialog('Crear');
  }

  void editDialog(Client client) {
    clientsController.setData(client);
    dataDialog('Actualizar');
  }

  void viewDialog(Client client) {}

  void dataDialog(String action) {
    Get.defaultDialog(
      title: '$action Cliente',
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 32),
      content: SizedBox(
        width: 350,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            textField(clientsController.phoneController, 'Teléfono'),
            textField(clientsController.nameController, 'Nombre'),
            textField(clientsController.addressController, 'Dirección'),
            textField(clientsController.hoodController, 'Barrio'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dialogButton('Cancelar', () => Get.back()),
                dialogButton(
                  action,
                  () {
                    switch (action) {
                      case 'Crear':
                        if (clientsController.checkData()) {
                          if (clientsController.clientExists()) {
                            errorMessage('Cliente Existente',
                                'El cliente con múmero de teléfono ${clientsController.phoneController.text} existe.');
                          } else {
                            clientsController.put();
                            Get.back();
                            succesMessage('Operación completada',
                                'La operación se ha completado con exito.');
                          }
                        } else {
                          adviseMessage(
                              'Error datos', 'Revisar la informacion.');
                        }
                      case 'Actualizar':
                        if (clientsController.checkData()) {
                          clientsController.put();
                          Get.back();
                          succesMessage('Operación completada.',
                              'El cliente se ha actualizado correctamente');
                        } else {
                          adviseMessage(
                              'Error datos', 'Revisar la informacion.');
                        }
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
