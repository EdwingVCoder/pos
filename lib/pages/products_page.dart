import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/products_controller.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/widgets/dialog.dart';
import 'package:pos/widgets/messages.dart';
import 'package:pos/widgets/page_layout.dart';
import 'package:pos/widgets/tiles/product_tile.dart';

class ProductsPage extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => PageLayout(
          data: getData(),
          onSearch: productsController.search,
          searchController: productsController.searchController,
          createDialog: createDialog,
        ));
  }

  List<Widget> getData() {
    return productsController.products.map(
      (Product product) {
        return ProductTile(
          product: product,
          editDialog: editDialog,
          onDelete: productsController.remove,
          viewDialog: viewDialog,
        );
      },
    ).toList();
  }

  void createDialog() {
    productsController.clear();
    inputDialog('Crear');
  }

  void editDialog(Product product) {
    productsController.setData(product);
    inputDialog('Actualizar');
  }

  void viewDialog(Product product) {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.symmetric(vertical: 32),
        title: '${product.name} #${product.code}',
        contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        content: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              dataDisplay(Icons.attach_money_rounded, 'Precio Compra',
                  '${product.buyPrice} COP'),
              dataDisplay(Icons.attach_money_rounded, 'Precio Venta',
                  '${product.sellPrice} COP'),
              dataDisplay(Icons.inventory_rounded, 'Stock',
                  '${product.stock} Unidades'),
            ],
          ),
        ));
  }

  void inputDialog(String action) {
    Get.defaultDialog(
      radius: 30,
      titlePadding: const EdgeInsets.all(16),
      title: '$action Producto',
      contentPadding: const EdgeInsets.symmetric(horizontal: 32),
      content: SizedBox(
        width: 350,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            textField(
              productsController.codeController,
              'Código',
              readOnly: action == 'Actualizar',
            ),
            textField(productsController.nameController, 'Nombre'),
            textField(productsController.buyPriceController, 'Precio compra'),
            textField(productsController.sellPriceController, 'Precio venta'),
            textField(productsController.stockController, 'Stock'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dialogButton(
                  'Cancelar',
                  () => Get.back(),
                ),
                dialogButton(
                  action,
                  () {
                    switch (action) {
                      case 'Crear':
                        if (productsController.checkData()) {
                          if (productsController.productExists()) {
                            errorMessage('Producto Existente',
                                'El producto con código #${productsController.codeController.text} existe actualmente.');
                          } else {
                            productsController.put();
                            Get.back();
                            succesMessage('Operación completada',
                                'La operación se ha completado con exito.');
                          }
                        } else {
                          adviseMessage(
                              'Error datos', 'Revisar la informacion.');
                        }
                      case 'Actualizar':
                        if (productsController.checkData()) {
                          productsController.put();
                          Get.back();
                          succesMessage('Operación completada',
                              'El producto se ha actualizado correctamente.');
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
