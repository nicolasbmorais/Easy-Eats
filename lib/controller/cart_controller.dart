import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController() {
    reset();
  }

  List<Products> cartList = [];
  String price = '';
  void reset() {}

  void addProducts(Products productList) {
    cartList.add(productList);
  }

  void sumCartList() {
    num totalValue = 0;

    for (var index = 0; index < cartList.length; index++) {
      final convert = num.tryParse(cartList[index].price ?? '0');
      if (convert != null) {
        totalValue += convert;
      }
    }

    print(totalValue);
  }

}
