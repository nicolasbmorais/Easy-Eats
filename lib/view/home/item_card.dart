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
      final Productos(nombre: name, linkImagen: image, precio: price) =
          foodController.pizzaList[index];

      return GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(fit: BoxFit.cover, image ?? 'Erro'),
                ),
                const SizedBox(height: 20),
                Text(
                  name ?? 'Erro',
                  style: TextStyle(
                    color: ColorPalette.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'R\$ ${price!.replaceAll('.', ',')}',
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
      );
    });
  }
}
