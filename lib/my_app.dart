import 'package:dio/dio.dart';
import 'package:easy_eats/controller/auth_controller.dart';
import 'package:easy_eats/controller/cart_controller.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/repository/burguer_repository.dart';
import 'package:easy_eats/repository/pizza_repository.dart';
import 'package:easy_eats/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<FoodController>(
          create: (_) => FoodController(
            burguerRepository: BurguerRepository(dio: Dio()),
            pizzaRepository: PizzaRepository(dio: Dio()),
          ),
        ),
        ChangeNotifierProvider<CartController>(
          create: (_) => CartController(),
        ),
      ],
      child: MaterialApp(
        title: 'Food For Everyone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Nunito',
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
