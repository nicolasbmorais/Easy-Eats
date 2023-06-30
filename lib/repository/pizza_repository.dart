// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:easy_eats/model/pizza/pizza_products_model.dart';

class PizzaRepository {
  Dio dio;
  PizzaRepository({
    required this.dio,
  });

  Future<List<Productos>> getPizzasList() async {
    try {
      final response = await dio.get(
        'https://pizzaallapala.p.rapidapi.com/productos',
        options: Options(
          headers: {
            'X-RapidAPI-Key':
                '5442f1c967msh1640d584b6fac28p1cefa4jsnd0364eb3deef',
            'X-RapidAPI-Host': 'pizzaallapala.p.rapidapi.com'
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

  // Future getBurguersList() async {
  //   try {
  //     final response = await dio.get(
  //         'https://burgers-hub.p.rapidapi.com/burgers',
  //         options: Options(method: 'GET'));

  //     var lista = (response.data as List)
  //         .map((e) => BurguerProductsModel.fromJson(e))
  //         .toList();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   // return lista;
  // }

// Future<BurguerProductsModel?> getBurguersList() async {
//     BurguerProductsModel? burguerList;
//     try {
//       Response response =
//           await _dio.get('https://pizzaallapala.p.rapidapi.com/productos');

//       print('burgList: $burguerList.data');
//       print('Response: $response.data');

//       var list = (response.data as List)
//           .map((e) => BurguerProductsModel.fromJson(e))
//           .toList();
//       print(list.length);
//     } on DioException catch (err) {
//       print(err.response!.statusMessage);
//     } catch (e) {
//       print(e.toString());
//     }

//     return burguerList;
//   }