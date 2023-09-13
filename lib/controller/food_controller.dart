import 'package:flutter/material.dart';

import 'package:easy_eats/model/burguer/burguer_products_model.dart';
import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:easy_eats/repository/burguer_repository.dart';
import 'package:easy_eats/repository/pizza_repository.dart';

class FoodController extends ChangeNotifier {
  final BurguerRepository? burguerRepository;
  final PizzaRepository? pizzaRepository;
  FoodController({
    required this.burguerRepository,
    required this.pizzaRepository,
  });

  List<BurguerProductsModel> _burguersList = [];
  List<BurguerProductsModel> get burguersList => _burguersList;

  List<Products> _pizzaList = [];
  List<Products> get pizzaList => _pizzaList;

  List<Products> productsCartList = [];

  Future<void> getProductsList() async {
    _burguersList = [];
    _pizzaList = [];
    final pizzaResponse = await pizzaRepository!.getPizzasList();
    _pizzaList.addAll(pizzaResponse);
    // final burguerResponse = await burguerRepository!.getBurguersList();
    // _burguersList.addAll(burguerResponse);
    notifyListeners();
  }

  void removeItemFromCart(Products products) {
    productsCartList.remove(products);
    notifyListeners();
  }
}
