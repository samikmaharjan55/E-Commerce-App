import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WishlistScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.4,
          ),
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: Product.products[index],
                widthFactor: 1.1,
                leftPosition: 100,
                isWishlist: true,
              ),
            );
          }),
    );
  }
}
