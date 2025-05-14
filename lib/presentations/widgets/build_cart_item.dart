import 'package:flutter/material.dart';
import 'package:example_menu/domain/models/food.dart';

class BuildCartItem extends StatelessWidget {
  final Food food;
  final int quantity;

  const BuildCartItem({
    Key? key,
    required this.food,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = double.tryParse(food.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    final total = price * quantity;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: ListTile(
        leading: Image.asset(food.imgPath, width: 50, height: 50),
        title: Text(food.foodName),
        subtitle: Text('Cantidad: $quantity'),
        trailing: Text('\$${total.toStringAsFixed(2)}'),
      ),
    );
  }
}
