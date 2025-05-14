import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

mixin Header {
  AppBar getHeader({Widget? widgetChildText, BuildContext? context}) {
    // Asegúrate de que el context no sea null
    final cartCount = context != null
        ? context.watch<CartProvider>().cartItems.length
        : 0;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: widgetChildText,
      leading: context != null && Navigator.canPop(context)
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: [
        // Icono del carrito con contador
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_basket),
              color: Colors.white,
              onPressed: () {
                if (context != null) {
                  context.push('/cart', extra: {'cartItems': cartCount});
                }
              },
            ),
            if (cartCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
