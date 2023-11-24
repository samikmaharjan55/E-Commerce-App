import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });
  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=1857&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=1857&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=1857&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=1857&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=1857&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
  ];
}
