import 'package:easy_eats/controller/food_controller.dart';
import 'package:easy_eats/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_eats/common/buttons/custom_text_button.dart';
import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/common/buttons/terciary_button.dart';
import 'package:easy_eats/common/input/input_text_form_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

enum AuthMode {
  login,
  signUp,
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormBuilderState>();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  AuthMode _authMode = AuthMode.login;

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthController, FoodController>(builder: (context,
        AuthController authController, FoodController foodController, _) {
      return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
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
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 100),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            child: Image.asset(
                              'assets/images/logo_app.png',
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomTextButton(
                                    title: 'Login',
                                    isSelected: _authMode == AuthMode.login
                                        ? true
                                        : false,
                                    onTap: () {
                                      setState(() {
                                        _authMode = AuthMode.login;
                                      });
                                    },
                                  ),
                                  CustomTextButton(
                                    title: 'Cadastrar',
                                    isSelected: _authMode == AuthMode.login
                                        ? false
                                        : true,
                                    onTap: () {
                                      setState(() {
                                        _authMode = AuthMode.signUp;
                                      });
                                    },
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
                          if (_authMode == AuthMode.login)
                            Column(
                              children: [
                                const SizedBox(height: 34),
                                TerciaryButton(
                                  title: 'Esqueçeu a senha?',
                                  textColor: Color(0xFFFA4A0C),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: PrimaryButton(
                      title:
                          _authMode == AuthMode.login ? 'Login' : 'Criar Conta',
                      onPressed: () async {
                        if (formKey.currentState!.saveAndValidate()) {
                          if (_authMode == AuthMode.login) {
                            await authController.signIn(
                              context: context,
                              email: _emailEditingController.value.text,
                              password: _passwordEditingController.value.text,
                            );
                          } else {
                            await authController.createUser(
                              context: context,
                              email: _emailEditingController.value.text,
                              password: _passwordEditingController.value.text,
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
