import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/service/auth_service.dart';
import 'package:easy_eats/view/home/cart_page.dart';
import 'package:easy_eats/view/home/item_card.dart';
import 'package:easy_eats/view/home/items_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    await context.read<FoodController>().getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodController>(
        builder: (context, FoodController foodController, _) {
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
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 30),
                      child: SearchBar(
                        hintText: 'Pesquisar',
                        backgroundColor:
                            MaterialStatePropertyAll(ColorPalette.white),
                        elevation: const MaterialStatePropertyAll(1),
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(
                            color: ColorPalette.greyIcons,
                            fontSize: 17,
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
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisCount: 1, // número de itens por linha
                    ),
                    itemCount: foodController.pizzaList.length,
                    itemBuilder: (context, index) => ItemCard(
                      index: index,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                ItemsDetailsPage(index: index),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({
    super.key,
  });

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorPalette.white,
      child: Column(
        children: [
          builderHeader(context),
          builderMenuItems(context),
        ],
      ),
    );
  }

  Widget builderHeader(BuildContext context) => Container(
        width: double.infinity,
        color: const Color(0xFFDBD9D9),
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.paddingOf(context).top, bottom: 24),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  _authService.auth.currentUser!.photoURL ??
                      'assets/images/user-icon.png'),
              radius: 52,
            ),
            const SizedBox(height: 12),
            const Text('Username'),
            Text(_authService.auth.currentUser!.email ?? ''),
          ],
        ),
      );

  Widget builderMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(
                Icons.home_filled,
                color: ColorPalette.black,
              ),
              title: const Text('Tela inicial'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => HomePage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.abc,
                color: ColorPalette.black,
              ),
              title: const Text('Carrinho'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CartPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
                color: ColorPalette.black,
              ),
              title: const Text('Sair'),
              onTap: () => _authService.logout(),
            ),
          ],
        ),
      );
}
