// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:easy_eats/common/color/color_palette.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: ListView(
          children: const [
            Row(
              children: [
                Icon(Icons.swipe),
                Text('Deslize em um item para excluir'),
              ],
            ),
            ListTileWidget(
              image:
                  'https://img.freepik.com/fotos-gratis/salada-de-frango-com-legumes-e-azeitonas_1220-4069.jpg?w=740&t=st=1687872626~exp=1687873226~hmac=0ba41739a5e214062732bbf7ebaf00494e46e6781c0a1ae580821a898d66c5f2',
              title: 'title',
              subTitle: 'subTitle',
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Slidable(
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
            child: Center(
              child: Icon(
                Icons.delete,
                color: ColorPalette.white,
                size: 26,
              ),
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
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorPalette.black,
                      fontWeight: FontWeight.w600,
                    )),
                Text(subTitle,
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorPalette.errorSystem,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
