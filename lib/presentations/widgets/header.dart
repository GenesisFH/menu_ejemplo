import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:example_menu/presentations/screens/cart_screen.dart';

mixin Header {
  AppBar getHeader({Widget? widgetChildText, BuildContext? context}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: widgetChildText,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: () {
          if (context != null) {
            context.pop();
          }
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_basket),
          color: Colors.white,
          onPressed: () {
            if (context != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            }
          },
        ),
      ],
    );
  }
}
