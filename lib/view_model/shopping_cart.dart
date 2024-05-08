import 'package:e_commerce_platform/Model/gadget_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCart extends StateNotifier<List<Gadget>> {
  ShoppingCart() : super([]);

  void addItem(Gadget gadget) {
    state = [...state, gadget];
  }
}