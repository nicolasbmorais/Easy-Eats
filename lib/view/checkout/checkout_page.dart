import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/controller/cart_controller.dart';
import 'package:easy_eats/view/checkout/complete_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    context.read<CartController>().sumCartList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        title: Text(
          'Confirmação',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Color(0xFF8B8B8B),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pagamento',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        'Método de pagamento',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFFFFFFF),
                      child: Column(
                        children: [
                          radioButton(
                            name: 'card',
                            icon: 'card_icon',
                            text: 'Cartão',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Divider(
                              color: Color(0xFF8B8B8B),
                              thickness: 0.5,
                            ),
                          ),
                          radioButton(
                            name: 'bankAccount',
                            icon: 'bank_icon',
                            text: 'Conta bancária',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        'Método de entrega',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFFFFFFF),
                      child: Column(
                        children: [
                          radioButton(
                            name: 'door',
                            text: 'Entregar na porta',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Divider(
                              color: Color(0xFF8B8B8B),
                              thickness: 0.5,
                            ),
                          ),
                          radioButton(
                            name: 'pickup',
                            text: 'Retirar',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        r'R$ 23',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: PrimaryButton(
                    title: 'Prosseguir para o pagamento',
                    onPressed: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CompleteOrder(),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget radioButton({
    required String name,
    required String text,
    String? icon,
  }) {
    return ListTileTheme(
      horizontalTitleGap: 0.0,
      child: FormBuilderRadioGroup(
        onChanged: (value) {},
        name: name,
        options: [
          FormBuilderFieldOption(
            value: name,
            child: Row(children: [
              icon != null
                  ? Image.asset('assets/images/$icon.png')
                  : SizedBox.shrink(),
              SizedBox(width: 12),
              Text(text),
            ]),
          ),
        ],
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(),
          ],
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
