import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController() {
    reset();
  }

  List<Products> cartList = [];

  void reset() {}

  void addProducts(Products productList) {
    cartList.add(productList);
  }
}
