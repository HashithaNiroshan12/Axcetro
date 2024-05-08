import 'package:e_commerce_platform/Model/gadget_model.dart';
import 'package:e_commerce_platform/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final cart = ref.watch(shoppingCartProvider);
          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index];
              return ListTile(
                leading: Image.network(
                  item.images[0],
                  width: 50,
                  height: 50,
                ),
                title: Text(item.name),
                subtitle: Text('\$${item.price}'),
              );
            },
          );
        },
      ),
    );
  }
}