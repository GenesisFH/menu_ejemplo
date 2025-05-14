import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/widgets/build_cart_item.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final foodList = Foods.foods;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        centerTitle: true,
      ),
      body: cartProvider.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Tu carrito está vacío.',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      final food = foodList.firstWhere((f) => f.id == item.id);
                      return BuildCartItem(food: food, quantity: item.quantity);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${cartProvider.getCartTotal(foodList).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
