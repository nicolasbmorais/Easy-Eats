import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsDetailsPage extends StatelessWidget {
  final int index;
  const ItemsDetailsPage({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(
        builder: (context, FoodController foodController, _) {
      // final BurguerProductsModel(:name, :images, :desc, :price) =
      //     foodController.burguersList[index];
      final Productos(
        nombre: name,
        linkImagen: image,
        precio: price,
        descripcion: desc
      ) = foodController.pizzaList[index];

      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left_outlined,
                color: ColorPalette.black, size: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline_rounded,
                color: ColorPalette.black,
                size: 20,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(image ?? 'Erro'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name ?? 'Erro',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${price.toString().replaceAll('.', ',')}',
                          style: TextStyle(
                            color: ColorPalette.errorSystem,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // titleText(title: 'Informações de entrega'),
                        // descriptionText(
                        //     description: 'Delivered between 8pm to 9:32 pm'),
                        // const SizedBox(height: 42),
                        titleText(title: 'Descrição'),
                        descriptionText(
                          description: desc ?? 'Erro',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: PrimaryButton(
                        title: 'Adicionar ao carrinho',
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Text descriptionText({required String description}) {
    return Text(
      description,
      style: TextStyle(
        color: ColorPalette.greyIcons,
        fontSize: 15,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text titleText({required String title}) {
    return Text(
      title,
      style: TextStyle(
        color: ColorPalette.black,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
