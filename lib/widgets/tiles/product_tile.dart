import 'package:flutter/material.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/widgets/tiles/components.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Function(Product) editDialog;
  final Function(int) onDelete;
  final Function(Product) viewDialog;
  const ProductTile({
    super.key,
    required this.product,
    required this.editDialog,
    required this.onDelete,
    required this.viewDialog,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(product.stock.toString()),
      ),
      title: Text(product.name),
      subtitle: Text('#${product.code} - ${product.sellPrice} COP'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          tileButton(Icons.edit_rounded, () => editDialog(product)),
          tileButton(Icons.delete_rounded, () => onDelete(product.id)),
        ],
      ),
      onTap: () => viewDialog(product),
    );
  }
}
