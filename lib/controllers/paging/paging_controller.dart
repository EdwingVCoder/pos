import 'package:get/get.dart';
import 'package:pos/controllers/paging/pages.dart';

class PagingController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageList pageList = PageList();

  void selectIndex(int index) {
    selectedIndex.value = index;
  }
}
