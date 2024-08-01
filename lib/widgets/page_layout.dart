import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final List<Widget> data;
  final VoidCallback createDialog;
  final TextEditingController searchController;
  final VoidCallback onSearch;
  const PageLayout(
      {super.key,
      required this.data,
      required this.createDialog,
      required this.searchController,
      required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(context),
        dataDisplay(context, data),
      ],
    );
  }

  Widget header(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchBar(context),
          createButton(context),
        ],
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded,
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (value) => onSearch(),
            ),
          ),
          IconButton(
              onPressed: () {
                searchController.clear();
                onSearch();
              },
              icon: Icon(
                Icons.close_rounded,
                color: Theme.of(context).colorScheme.primary,
              ))
        ],
      ),
    );
  }

  Widget createButton(BuildContext context) {
    return FilledButton(
      onPressed: createDialog,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Text(
          'Crear',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget dataDisplay(BuildContext context, List<Widget> data) {
    return Expanded(
      child: data.isEmpty
          ? const Center(
              child: Text('No hay datos.'),
            )
          : ListView(
              children: data,
            ),
    );
  }
}
