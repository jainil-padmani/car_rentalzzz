// import 'package:car_rental/startup/introduction/int3.dart';
// import 'package:car_rental/startup/login.dart';
// import 'package:flutter/material.dart';

// class intro2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // Image
//                   Image.asset(
//                     'assets/images/intro1.png',
//                     width: 300,
//                     height: 300,
//                   ),

//                   // Description
//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           'SELECT YOUR DREAM CAR',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Choose your dream car from our exquisite selection, where style meets performance, and luxury knows no limits.',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             // Custom-styled "Next" button
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => intro3(),
//                   ),
//                 );
//               },
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: 10), // Add horizontal padding
//                 child: Material(
//                   elevation: 5, // Add elevation for a slight shadow effect
//                   borderRadius: BorderRadius.circular(20), // Circular border radius
//                   color: Colors.green, // Background color
//                   child: Ink(
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(20), // Circular border radius
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         child: Center(
//                           child: Text(
//                             'Next',
//                             style: TextStyle(
//                               color: Colors.white, // Text color
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // "Skip" button
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => Login(),
//                   ),
//                 );
//               },
//               child: Text('Skip', style: TextStyle(fontSize: 12),),
//             ),
//           ],
//         ),
//       ],
//     ),
//     );
//   }
// }