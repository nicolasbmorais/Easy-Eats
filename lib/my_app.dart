import 'package:dio/dio.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/controller/auth_controller.dart';
import 'package:easy_eats/repository/burguer_repository.dart';
import 'package:easy_eats/repository/pizza_repository.dart';
import 'package:easy_eats/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodController>(
          create: (_) => FoodController(
            burguerRepository: BurguerRepository(dio: Dio()),
            pizzaRepository: PizzaRepository(dio: Dio()),
          ),
        ),
        Provider<AuthController>(
          create: (_) => AuthController(),
        ),
      ],
      child: MaterialApp(
        title: 'Food For Everyone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.primary),
            fontFamily: 'Nunito',
            useMaterial3: true,
            scaffoldBackgroundColor: ColorPalette.background,
            appBarTheme: AppBarTheme(color: ColorPalette.background)),
        home: SplashScreen(),
      ),
    );
  }
}
