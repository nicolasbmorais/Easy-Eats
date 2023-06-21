import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:easy_eats/common/buttons/custom_text_button.dart';

import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/common/buttons/terciary_button.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/common/input/input_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Image.asset('assets/images/logo_app.png'),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextButton(
                                  title: 'Login',
                                  isSelected: true,
                                  onTap: () {},
                                ),
                                CustomTextButton(
                                  title: 'Cadastrar',
                                  isSelected: false,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              // height: MediaQuery.sizeOf(context).height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormBuilder(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputTextFormField(
                            name: 'email',
                            labelText: 'Email',
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 30),
                          InputTextFormField(
                            name: 'password',
                            labelText: 'Senha',
                            obscureText: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 34),
                          TerciaryButton(
                            title: 'Esqueçeu a senha?',
                            textColor: ColorPalette.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: PrimaryButton(
                      title: 'Login',
                      onPressed: () {},
                    ),
                  ) // Expanded(
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 24),
                  //       child: PrimaryButton(title: 'Login', onPressed: () {}),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
