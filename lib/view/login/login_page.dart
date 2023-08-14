import 'dart:async';

import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/controller/auth_controller.dart';
import 'package:easy_eats/view/home/home_page.dart';
import 'package:easy_eats/view/home/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_eats/common/buttons/custom_text_button.dart';
import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/common/buttons/terciary_button.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/common/input/input_text_form_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormBuilderState>();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthController, FoodController>(builder: (context,
        AuthController authController, FoodController foodController, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height - 414,
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
                          const SizedBox(height: 100),
                          Image.asset('assets/images/logo_app.png'),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormBuilder(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputTextFormField(
                            textEditingController: _emailEditingController,
                            name: 'email',
                            labelText: 'Email',
                            onChanged: (value) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email()
                            ]),
                          ),
                          const SizedBox(height: 30),
                          InputTextFormField(
                            textEditingController: _passwordEditingController,
                            name: 'password',
                            labelText: 'Senha',
                            obscureText: true,
                            onChanged: (value) {},
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(5)
                            ]),
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
                      onPressed: () async {
                        if (formKey.currentState!.saveAndValidate()) {
                          final validate = await authController.signIn(
                              email: _emailEditingController.value.text,
                              password: _passwordEditingController.value.text);
                          if (validate) {
                            // ignore: use_build_context_synchronously
                            //TODO: colocar loading
                            await Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const HomePage(),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ) // Expanded(
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
