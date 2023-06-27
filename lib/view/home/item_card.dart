import 'package:easy_eats/common/color/color_palette.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        color: Colors.amber,
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
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://img.freepik.com/fotos-gratis/salada-de-frango-com-legumes-e-azeitonas_1220-4069.jpg?w=740&t=st=1687872626~exp=1687873226~hmac=0ba41739a5e214062732bbf7ebaf00494e46e6781c0a1ae580821a898d66c5f2',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nome do produto',
                style: TextStyle(
                  color: ColorPalette.black,
                  fontSize: 22,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Valor ',
                style: TextStyle(
                  color: ColorPalette.errorSystem,
                  fontSize: 17,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
