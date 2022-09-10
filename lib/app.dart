import 'package:bloc_shopper_cart/catalog/view/catalog_page_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart/view/cart_page_getx.dart';
import 'shopping_repository.dart';

class App extends StatelessWidget {
  const App({super.key, required this.shoppingRepository});

  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Bloc Shopping Cart',
      initialRoute: '/',
      routes: {
        '/': (_) => CatalogPageGetx(),
        '/cart': (_) => const CartPageGetx(),
      },
    );
  }
}
