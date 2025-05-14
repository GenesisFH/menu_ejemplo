import 'package:flutter/material.dart';
import 'package:example_menu/domain/models/food.dart';

// Representa un artículo en el carrito de compras
class CartItem {
  final int id;
  final int quantity;

  CartItem({required this.id, required this.quantity});
}
 
// Proveedor de estado para el carrito de compras
class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  // Devuelve la cantidad total de artículos en el carrito
  int get cartCount => _cartItems.fold(0, (total, item) => total + item.quantity);

  // Devuelve la cantidad de un artículo específico en el carrito
  void addToCart(int foodId) {
    final index = _cartItems.indexWhere((item) => item.id == foodId);
    if (index != -1) {
      _cartItems[index] = CartItem(
        id: _cartItems[index].id,
        quantity: _cartItems[index].quantity + 1,
      );
    } else {
      _cartItems.add(CartItem(id: foodId, quantity: 1));
    }
    notifyListeners();
  }
  // Aumenta la cantidad de un artículo en el carrito
  void removeFromCart(int foodId) {
    _cartItems.removeWhere((item) => item.id == foodId);
    notifyListeners();
  }
  // Disminuye la cantidad de un artículo en el carrito
  double getCartTotal(List<Food> allFoods) {
    double total = 0.0;
    for (final item in _cartItems) {
      final food = allFoods.firstWhere((f) => f.id == item.id, orElse: () => throw Exception('Food not found'));
      final parsedPrice = double.tryParse(food.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
      total += parsedPrice * item.quantity;
    }
    return total;
  }
  // Elimina un artículo del carrito
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
