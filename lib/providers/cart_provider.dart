import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    cartItems.remove(product);
    notifyListeners();
  }
}
