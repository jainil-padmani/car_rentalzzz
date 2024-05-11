// import 'package:car_rental/homescreen/homescreen.dart';
// import 'package:flutter/material.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Center(
//           child: Text(
//             'OTP Verification',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 10,),
//                 Text('Please enter the verification code we just sent you on', 
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                 ),),
//                 SizedBox(height: 10,),
//                 Container(
//                   width: 330,
//                   height: 55,
//                   decoration: BoxDecoration(
//                     color: Colors.white, // Background color
//                     borderRadius: BorderRadius.circular(8), // Rounded corners
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1), // Shadow color and opacity
//                         blurRadius: 3, // Shadow blur radius
//                         offset: Offset(0, 3), // Shadow offset
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter OTP ',
//                         border: InputBorder.none, // Remove the default input border
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10), // Padding around the text
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Haven't received the verification code?", style: TextStyle(fontSize: 15),),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => OtpScreen(),
//                       ),
//                     );
//                   },
//                   child: Text('Resend', style: TextStyle(fontSize: 15),),
//                 ),
//               ],
//             ),
//                 SizedBox(height: 40),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => homeScreen(), 
//                       ),
//                     );
//                   },
//                   child: Container(
//                     width: 330,
//                     height: 45,
//                     child: Material(
//                       elevation: 5,
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.green,
//                       child: Ink(
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: EdgeInsets.all(10),
//                             child: Center(
//                               child: Text(
//                                 'Verify',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ],
//     ),
//     );
//   }
// }