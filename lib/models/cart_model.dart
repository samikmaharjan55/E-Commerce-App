import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  // total of all cart items
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 20.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(subtotal, delivery) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subotal) {
    if (subtotal >= 20.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 20.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  // convert int value into string value
  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  // convert int value into string value
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
