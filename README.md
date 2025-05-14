config/router/app_router.dart {
	
	la diferencia principal es que ahora la lógica para manejar la ruta de detalle (/detail/:id) se delega al 	método RouteLogic.getDetailFood en lugar de estar directamente en el archivo de rutas. Esto ayuda a mantener 	el archivo app_router.dart más limpio y enfocado únicamente en la definición de rutas.

}

presentations/provider/cart_provider.dart {

	El archivo cart_provider.dart contiene la implementación de un CartProvider, que es un ChangeNotifier 	utilizado para gestionar el estado del carrito de compras en la aplicación

}


Presentation/widgets/header.dart {
	
	Modifiqué el botón de la cesta (ícono de shopping_basket) para que, al hacer clic, navegue a la pantalla 	CartScreen utilizando GoRouter en lugar de Navigator.push. Esto asegura que la navegación sea consistente 
	con el sistema de rutas que estás utilizando.
}

Presentations/widgets/build_cart_item.dart {
    // pendiente a documentar
}