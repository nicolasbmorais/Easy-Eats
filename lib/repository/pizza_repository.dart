import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PizzaRepository {
  Dio dio;
  PizzaRepository({
    required this.dio,
  });

  Future<List<Products>> getPizzasList() async {
    try {
      final response = await dio.get(
        'https://pizzaallapala.p.rapidapi.com/productos',
        options: Options(
          headers: {
            'X-RapidAPI-Key': dotenv.env['X_API_KEY'],
            'X-RapidAPI-Host': dotenv.env['X_RapidAPI_Host'],
          },
        ),
      );

      return PizzaProductsModel.fromJson(response.data).productos!.toList();
    } catch (e) {
      log('error: $e');
      throw Exception('Falha ao obter a lista de pizzas.');
    }
  }
}
