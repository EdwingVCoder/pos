import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/paging/paging_controller.dart';

class HomePage extends StatelessWidget {
  final PagingController controller = Get.put(PagingController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Row(
          children: [
            sideBar(context),
            Expanded(
              child: baseContainer(
                controller.pageList.pages[controller.selectedIndex.value].page,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideBar(BuildContext context) {
    return baseContainer(
      ListView.builder(
        itemCount: controller.pageList.pages.length,
        itemBuilder: (context, index) {
          var page = controller.pageList.pages[index];

          return navButon(context, page.icon, page.label, index);
        },
      ),
      width: 300,
    );
  }

  Widget navButon(
      BuildContext context, IconData icon, String label, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: controller.selectedIndex.value == index
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
      ),
      child: ListTile(
        onTap: () => controller.selectIndex(index),
        selected: controller.selectedIndex.value == index,
        textColor: Theme.of(context).colorScheme.primary,
        selectedColor: Colors.white,
        iconColor: controller.selectedIndex.value == index
            ? Colors.white
            : Theme.of(context).colorScheme.primary,
        leading: Icon(icon),
        title: Text(label),
      ),
    );
  }

  Container baseContainer(Widget child, {double? width}) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(16),
      decoration: decoration(),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
            color: Colors.black45,
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset.zero)
      ],
    );
  }
}
