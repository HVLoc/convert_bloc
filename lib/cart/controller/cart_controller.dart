import 'package:get/get.dart';

import '../../catalog/catalog.dart';

class CartController extends GetxController {
  final RxList<Item> items = RxList<Item>();

  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await 800.milliseconds.delay();
    isLoading.value = false;
    super.onInit();
  }

  Future<void> onItemAdded(Item item) async {
    try {
      items.add(item);
    } catch (_) {
      print(_);
    }
  }

  void onItemRemoved(Item item) {
    try {
      items.remove(item);
    } catch (_) {
      print(_);
    }
  }

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }
}
