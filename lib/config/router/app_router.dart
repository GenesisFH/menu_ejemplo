import 'package:example_menu/domain/route_provider.dart';
import 'package:example_menu/presentations/screens/home_menu_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeMenuScreen()),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        return RouteLogic.getDetailFood(state.pathParameters['id']!);
      },
    ),
  ],
);
