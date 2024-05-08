import 'package:e_commerce_platform/screens/shoppingcart_page.dart';
import 'package:flutter/material.dart';

class SlideTransitionPageRouteBuilder extends PageRouteBuilder {
  SlideTransitionPageRouteBuilder()
      : super(
          transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (context, animation, secondaryAnimation) => ShoppingCartPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}