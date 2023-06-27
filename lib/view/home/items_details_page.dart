import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:flutter/material.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Image.network(
              'https://img.freepik.com/fotos-gratis/salada-de-frango-com-legumes-e-azeitonas_1220-4069.jpg?w=740&t=st=1687872626~exp=1687873226~hmac=0ba41739a5e214062732bbf7ebaf00494e46e6781c0a1ae580821a898d66c5f2',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Veggie tomato mix',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'RS 90',
                        style: TextStyle(
                          color: ColorPalette.errorSystem,
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(title: 'Informações de entrega'),
                      descriptionText(
                          description: 'Delivered between 8pm to 9:32 pm'),
                      const SizedBox(height: 42),
                      titleText(title: 'Política de devolução'),
                      descriptionText(
                          description:
                              'Todos os nossos alimentos são verificados duas vezes antes de sair de nossas lojas, portanto, em qualquer caso, você encontrou um alimento quebrado, entre em contato com nossa central de atendimento imediatamente.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: PrimaryButton(
                          title: 'Adicionar ao carrinho',
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text descriptionText({required String description}) {
    return Text(
      description,
      style: TextStyle(
        color: ColorPalette.greyIcons,
        fontSize: 15,
        // fontFamily: 'Inter',
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
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
