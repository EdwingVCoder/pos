import 'package:flutter/material.dart';
import 'package:pos/models/database/models.dart';
import 'package:pos/widgets/tiles/components.dart';

class ClientTile extends StatelessWidget {
  final Client client;
  final Function(Client) editDialog;
  final Function(int) onDelete;
  final Function(Client) viewDialog;
  const ClientTile(
      {super.key,
      required this.client,
      required this.editDialog,
      required this.onDelete,
      required this.viewDialog});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(client.name[0].toUpperCase()),
      ),
      title: Text(client.name),
      subtitle: Text(client.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          tileButton(Icons.edit_rounded, () => editDialog(client)),
          tileButton(Icons.delete_rounded, () => onDelete(client.id)),
        ],
      ),
      onTap: () => viewDialog(client),
    );
  }
}
