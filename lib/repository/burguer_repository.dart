// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import 'package:easy_eats/model/burguer/burguer_products_model.dart';

class BurguerRepository {
  Dio dio;
  BurguerRepository({
    required this.dio,
  });

  Future<List<BurguerProductsModel>> getBurguersList() async {
    try {
      final response = await dio.get(
        'https://burgers-hub.p.rapidapi.com/burgers',
        options: Options(
          headers: {
            'X-RapidAPI-Key':
                '5442f1c967msh1640d584b6fac28p1cefa4jsnd0364eb3deef',
            'X-RapidAPI-Host': 'burgers-hub.p.rapidapi.com'
          },
        ),
      );

      return (response.data as List)
          .map((e) => BurguerProductsModel.fromJson(e))
          .toList();
    } catch (e) {
      // Tratar o erro adequadamente (ex: lançar uma exceção personalizada, notificar o usuário, etc.)
      return [];
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