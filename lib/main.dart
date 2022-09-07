import 'package:bloc_shopper_cart/simple_bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'shopping_repository.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App(shoppingRepository: ShoppingRepository()));
}
