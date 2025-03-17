import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;

  Product({ required this.id, required this.name, required this.price });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({ required this.product, required this.quantity });
}
