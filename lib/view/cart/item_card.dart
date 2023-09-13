import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.index,
    this.onTap,
  });

  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(
        builder: (context, FoodController foodController, _) {
      final Products(name: name, linkImagen: image, price: price) =
          foodController.pizzaList[index];

      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 100,
          child: Card(
            elevation: 3,
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        image ?? '',
                      ),
                    ),
                  ),
                  Text(
                    name ?? '',
                    style: TextStyle(
                      color: ColorPalette.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'R\$ ${price?.replaceAll('.', ',')}',
                    style: TextStyle(
                      color: ColorPalette.errorSystem,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
