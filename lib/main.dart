import 'package:flutter/material.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FoodController()),
      ],
      child: MaterialApp(
        title: 'Food For Everyone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.primary),
          fontFamily: 'Nunito',
          useMaterial3: true,
          scaffoldBackgroundColor: ColorPalette.background,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}