import 'package:easy_eats/common/color/color_palette.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.background,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorPalette.greyIcons,
            ),
          ),
        ],
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Text(
                      'Comida deliciosa perto de você',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 30),
                      child: SearchBar(
                        hintText: 'Pesquisar',
                        backgroundColor: MaterialStatePropertyAll(ColorPalette.inputColor),
                        elevation: const MaterialStatePropertyAll(1),
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(
                            color: ColorPalette.greyIcons,
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            )),
                        child: const SingleChildScrollView(
                          child: Column(
                            children: [
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                              Text('data'),
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
