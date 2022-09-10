import 'package:bloc_shopper_cart/catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/controller/cart_controller.dart';
import '../controller/catalog_controller.dart';

class CatalogPageGetx extends StatelessWidget {
  CatalogPageGetx({super.key});

  final CatalogController catalogController = Get.put(CatalogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CatalogAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          Obx(() => catalogController.isLoading.value
              ? const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CatalogListItem(
                      catalogController.catalog.value.getByPosition(index),
                    ),
                    childCount:
                        catalogController.catalog.value.itemNames.length,
                  ),
                )),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  AddButton({super.key, required this.item});

  final Item item;
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() => cartController.isLoading.value
        ? const CircularProgressIndicator()
        : TextButton(
            style: TextButton.styleFrom(
                disabledForegroundColor: theme.primaryColor.withOpacity(0.38)),
            onPressed: cartController.items.contains(item)
                ? null
                : () => cartController.onItemAdded(item),
            child: cartController.items.contains(item)
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          ));
  }
}

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).pushNamed('/cart'),
        ),
      ],
    );
  }
}

class CatalogListItem extends StatelessWidget {
  const CatalogListItem(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: ColoredBox(color: item.color)),
            const SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme)),
            const SizedBox(width: 24),
            AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
