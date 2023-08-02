// import 'package:easy_eats/service/auth_service.dart';
// import 'package:easy_eats/view/home/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_eats/common/buttons/secondary_button.dart';

// import 'package:easy_eats/common/color/color_palette.dart';
// import 'package:easy_eats/view/login/login_page.dart';

// class SplashScreen extends StatelessWidget {
//   SplashScreen({super.key});
//   final _authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 2)).then((value) {
//       // if (_authService.auth.currentUser != null) {
//       //   Navigator.push<void>(
//       //     context,
//       //     MaterialPageRoute<void>(
//       //       builder: (BuildContext context) => const HomePage(),
//       //     ),
//       //   );
//       // } else {
//       //   Navigator.push<void>(
//       //     context,
//       //     MaterialPageRoute<void>(
//       //       builder: (BuildContext context) => const LoginPage(),
//       //     ),
//       //   );
//       // }
//         Navigator.push<void>(
//           context,
//           MaterialPageRoute<void>(
//             builder: (BuildContext context) => const LoginPage(),
//           ),
//       );
//     });

//     return Scaffold(
//       backgroundColor: ColorPalette.primary,
//       body: SafeArea(
//         child: LayoutBuilder(builder: (context, constrains) {
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset('assets/images/logo_app.png'),
//                       const SizedBox(height: 30),
//                       Text(
//                         'Servindo a melhor comida para você',
//                         style: TextStyle(
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w900,
//                           fontSize: 40,
//                           letterSpacing: 1,
//                           color: ColorPalette.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/images/welcome_logo.png',
//                   width: constrains.maxWidth,
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
