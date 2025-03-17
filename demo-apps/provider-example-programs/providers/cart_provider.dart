import 'dart:html';

import 'package:flutter/material.dart';
import 'package:untitled/models/product_cart_model.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
          () => CartItem(product: product, quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalPrice {
    return _items.values.fold(0.0, (sum, item) {
      return sum + (item.product.price * item.quantity);
    });
  }
}
