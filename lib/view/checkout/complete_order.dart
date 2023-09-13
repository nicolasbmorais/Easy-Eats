import 'package:easy_eats/common/buttons/primary_button.dart';
import 'package:easy_eats/common/color/color_palette.dart';
import 'package:easy_eats/view/home/home_page.dart';
import 'package:flutter/material.dart';

class CompleteOrder extends StatefulWidget {
  const CompleteOrder({super.key});

  @override
  State<CompleteOrder> createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _stopGif();
    super.dispose();
  }

  Future<bool> _stopGif() {
    _animationController?.stop();
    _animationController?.dispose();
    _animationController = null;
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _stopGif,
      child: Scaffold(
        backgroundColor: ColorPalette.background,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFBFBF3),
          leading: IconButton(
            onPressed: () {
              _stopGif();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              child: Image.asset(
                "assets/images/well-done.gif",
                gaplessPlayback: true,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 42,
              child: Text(
                'PEDIDO FEITO',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              child: PrimaryButton(
                title: 'Ir para página inicial',
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()),
                  ModalRoute.withName('/'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
