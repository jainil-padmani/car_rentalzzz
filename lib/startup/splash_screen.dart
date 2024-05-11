// import 'package:car_rental/startup/introduction/introduction.dart';
// import 'package:flutter/material.dart';
// import 'dart:async'; 

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => IntroductionScreens(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.green,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/splash.png', 
//                 width: 220, 
//                 height: 220, 
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
