import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);

      case ProductScreen.routeName:
        return ProductScreen.route();

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
