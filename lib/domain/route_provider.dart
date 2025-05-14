import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/screens/detail_food.dart';

class RouteLogic {
  static DetailFood getDetailFood(String id) {
    final int idFood = int.parse(id); // Convertimos el id a entero
    print('el id de la comida es $idFood');
    final food = Foods.foods.firstWhere((element) => element.id == idFood); // Buscamos la comida por id
    print('el nombre de la comida es ${food.foodName}');
    return DetailFood(food: food); // Devolvemos la pantalla de detalle de comida con el objeto Food
  }
}