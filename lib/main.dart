import 'package:e_commerce_platform/Model/gadget_model.dart';
import 'package:e_commerce_platform/view_model/shopping_cart.dart';
import 'package:e_commerce_platform/screens/home_view.dart';
import 'package:e_commerce_platform/screens/product_details_page.dart';
import 'package:e_commerce_platform/screens/shoppingcart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

final shoppingCartProvider = StateNotifierProvider<ShoppingCart, List<Gadget>>((ref) => ShoppingCart());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/detail': (context) => const ProductDetailPage(),
          '/cart': (context) => ShoppingCartPage(),
        },
      ),
    );
  }
}
