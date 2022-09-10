import 'package:bloc_shopper_cart/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageGetx extends StatelessWidget {
  const CartPageGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ColoredBox(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            CartTotal()
          ],
        ),
      ),
    );
  }
}

class CartList extends GetWidget<CartController> {
  CartList({super.key});
  @override
  CartController get controller => Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final itemNameStyle = Theme.of(context).textTheme.headline6;

    return Obx(
      () => controller.isLoading.value
          ? const CircularProgressIndicator()
          : ListView.separated(
              itemCount: controller.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ListTile(
                    leading: const Icon(Icons.done),
                    title: Text(item.name, style: itemNameStyle),
                    onLongPress: () {
                      controller.onItemRemoved(item);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final hugeStyle =
        Theme.of(context).textTheme.headline1?.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => cartController.isLoading.value
                ? const CircularProgressIndicator()
                : Text('\$${cartController.totalPrice}', style: hugeStyle)),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buying not supported yet.')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
