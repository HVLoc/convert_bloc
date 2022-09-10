import 'package:bloc_shopper_cart/catalog/catalog.dart';
import 'package:get/get.dart';

const _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class CatalogController extends GetxController {
  final Rx<Catalog> catalog = const Catalog(itemNames: []).obs;
  RxBool isLoading = false.obs;
  @override
  Future<void> onInit() async {
    isLoading.value = true;

    await 800.milliseconds.delay();
    catalog.value = const Catalog(itemNames: _catalog);
    isLoading.value = false;
    super.onInit();
  }
}
