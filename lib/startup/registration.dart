// import 'package:car_rental/startup/login.dart';
// import 'package:car_rental/startup/otp.dart';
// import 'package:flutter/material.dart';

// class Registration extends StatefulWidget {
//   const Registration({super.key});

//   @override
//   State<Registration> createState() => _RegistrationState();
// }

// class _RegistrationState extends State<Registration> {
//   String mobileNumber = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Center(
//           child: Text(
//             'SignUp',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 10,),
//                 Text('Sign with the following option', style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                 ),),
//                 SizedBox(height: 10,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
//                   children: [
//                     // Google login button
//                     InkWell(
//                       onTap: () {
//                         // Add your Google login functionality here
//                       },
//                       child: Container(
//                         width: 150, 
//                         height: 55, 
//                         decoration: BoxDecoration(
//                           color: Colors.white, 
//                           borderRadius: BorderRadius.circular(8), 
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1), 
//                               blurRadius: 3, 
//                               offset: Offset(0, 3), 
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                           child: Image.asset('assets/images/icons8-google-48.png'),
//                         ),
//                       ),
//                     ),

//                     // Facebook login button
//                     InkWell(
//                       onTap: () {
//                         // Add your Facebook login functionality here
//                       },
//                       child: Container(
//                         width: 150, 
//                         height: 55, 
//                         decoration: BoxDecoration(
//                           color: Colors.white, 
//                           borderRadius: BorderRadius.circular(8),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1), 
//                               blurRadius: 3, 
//                               offset: Offset(0, 3), 
//                             ),
//                           ], 
//                         ),
//                         child: Center(
//                           child: Image.asset('assets/images/icons8-facebook-48.png'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                 Text('Name', style: TextStyle(
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
//                         hintText: 'Enter your Phone Name ',
//                         border: InputBorder.none, // Remove the default input border
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10), // Padding around the text
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Text('Email ID', style: TextStyle(
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
//                         hintText: 'Enter your Email ID ',
//                         border: InputBorder.none, // Remove the default input border
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10), // Padding around the text
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Text('Phone Number', style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                 ),),
//                 SizedBox(height: 10,),
//                 Container(
//                   width: 330,
//                   height: 55,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 3,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: TextField(
//                       keyboardType: TextInputType.phone,
//                       onChanged: (value) {
//                         mobileNumber = value; // Store the entered mobile number
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Enter your Phone Number',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 40),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => OtpScreen(), // Pass the mobile number to OTP screen
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
//                                 'SignUp',
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
          
//           Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             // "Skip" button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Already have an account? ", style: TextStyle(fontSize: 15),),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => Login(),
//                       ),
//                     );
//                   },
//                   child: Text('Login', style: TextStyle(fontSize: 15),),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//     );
//   }
// }
