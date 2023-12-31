import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/model/pizza/pizza_products_model.dart';
import 'package:easy_eats/view/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({
    required this.index,
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(
        builder: (context, FoodController foodController, _) {
      // final BurguerProductsModel(:name, :images, :desc, :price) =
      //     foodController.burguersList[index];
      final Products(
        name: name,
        linkImagen: image,
        price: price,
        description: desc
      ) = foodController.pizzaList[index];

      return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFF8F8F8),
          title: const Text('Detalhes'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left_outlined,
                color: Colors.black, size: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(image ?? ''),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    name ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${price.toString().replaceAll('.', ',')}',
                    style: TextStyle(
                      color: Color(0xFFFF0000),
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
                  onPressed: () {
                    context
                        .read<FoodController>()
                        .productsCartList
                        .add(foodController.pizzaList[index]);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const CartPage(),
                      ),
                    );
                  },
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
        color: Color(0xFF8B8B8B),
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
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
