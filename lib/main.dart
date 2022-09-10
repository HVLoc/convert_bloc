import 'package:flutter/widgets.dart';

import 'app.dart';
import 'shopping_repository.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  runApp(App(shoppingRepository: ShoppingRepository()));
}
