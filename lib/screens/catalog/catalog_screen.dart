import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_navbar.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      builder: (_) => CatalogScreen(category: category),
      settings: const RouteSettings(name: routeName),
    );
  }

  final Category category;
  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomNavBar(),
        body: GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.15,
            ),
            itemCount: categoryProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              );
            }));
  }
}
