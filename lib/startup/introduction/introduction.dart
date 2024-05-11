// import 'package:car_rental/startup/introduction/int1.dart';
// import 'package:car_rental/startup/introduction/int2.dart';
// import 'package:car_rental/startup/introduction/int3.dart';
// import 'package:car_rental/startup/login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class IntroductionScreens extends StatefulWidget {
//   @override
//   _IntroductionScreensState createState() => _IntroductionScreensState();
// }

// class _IntroductionScreensState extends State<IntroductionScreens> {

//   @override
//   void initState() {
//     super.initState();
//     _checkFirstLaunch();
//   }

//   void _checkFirstLaunch() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

//     if (!isFirstLaunch) {
//       _navigateToMainScreen();
//     }
//   }

//   void _navigateToMainScreen() {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => Login(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return intro1(
//             );
//           } else if (index == 1) {
//             return intro2(
//             );
//           } else if (index == 2) {
//             return intro3();
//           }
//           return Container();
//         },
//       ),
//     );
//   }

//   void _setFirstLaunchFlag() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isFirstLaunch', false);
//   }
// }
