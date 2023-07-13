import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/view/home/home_page.dart';
import 'package:easy_eats/view/login/login_page.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final List<Widget> _children = [
    const HomePage(),
    const LoginPage(),
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 31,
        unselectedItemColor: ColorPalette.greyIcons,
        selectedItemColor: ColorPalette.primary,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        backgroundColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
