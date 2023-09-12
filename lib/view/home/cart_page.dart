import 'package:easy_eats/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:easy_eats/common/color/color_palette.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(
        builder: (context, FoodController foodController, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Carrinho'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.swipe_left_outlined),
                    SizedBox(width: 10),
                    Text('Deslize em um item para excluir'),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                    foodController.productsCartList.length,
                    (index) => cartItem(
                      image:
                          foodController.productsCartList[index].linkImagen ??
                              '',
                      title: foodController.productsCartList[index].name ?? '',
                      subTitle:
                          foodController.productsCartList[index].description ??
                              '',
                      onPressed: () {
                        foodController.removeItemFromCart(
                            foodController.productsCartList[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget cartItem({
    required final String image,
    required final String title,
    required final String subTitle,
    required final void Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            const SizedBox(width: 24),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorPalette.primary,
              ),
              child: Center(
                child: Icon(
                  Icons.favorite_outline_rounded,
                  color: ColorPalette.white,
                  size: 26,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorPalette.primary,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: ColorPalette.white,
                  size: 26,
                ),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
        child: Card(
          color: ColorPalette.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
          child: Row(
            children: [
              Expanded(
                child: Image.network(
                  image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        color: ColorPalette.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 17,
                        color: ColorPalette.errorSystem,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
