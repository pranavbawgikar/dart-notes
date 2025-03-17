import 'package:flutter/material.dart';
import 'package:untitled/models/product_cart_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [
    Product(id: '126', name: 'Laptop', price: 1344),
    Product(id: '911', name: 'Smartphone', price: 32232),
    Product(id: '122', name: 'Air Conditioner', price: 3131),
  ];

  List<Product> get products => _products;
}
