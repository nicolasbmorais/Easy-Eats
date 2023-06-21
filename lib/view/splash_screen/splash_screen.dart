import 'package:flutter/material.dart';
import 'package:easy_eats/common/buttons/secondary_button.dart';

import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/view/login/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constrains) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      const SizedBox(height: 30),
                      Text(
                        'Servindo a melhor comida para você',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          letterSpacing: 1,
                          color: ColorPalette.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/welcome_logo.png',
                  width: constrains.maxWidth,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, right: 24, left: 24),
                  child: SecondaryButton(
                    title: 'Começar',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const LoginPage(),
                          ));
                    },
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
