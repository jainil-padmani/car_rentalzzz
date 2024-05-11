import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:car_rentalzzz/authgate.dart';
import 'package:flutter/material.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _firstName = 'Jainil';
  String _lastName = 'Padmani';
  String _gender = 'Male';
  String _email = 'jainilpadmani99@gmail.com';
  String _phone = '+91 74359 73215';
  String _dob = '01-09-2001';
  String _state = 'Gujarat';
  String _city = 'Rajkot';
  String _aadhar = '123456789098';
  String _license = 'hhbb12233454';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false, // removing the back button from the appbar
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Part
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/Profile.jpg'),
                      ),
                      SizedBox(width: 25,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$_firstName $_lastName',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      // Navigate to the edit_profile page and wait for a result
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile(
                          firstName: _firstName,
                          lastName: _lastName,
                          gender: _gender,
                          email: _email,
                          phone: _phone,
                          dob: _dob,
                          state: _state,
                          city: _city,
                          aadhar: _aadhar,
                          license: _license,
                          // Add more parameters as needed
                        )),
                      );
      
                      // Update the profile page if the result is not null
                      if (result != null && result is Map<String, String>) {
                        setState(() {
                          _firstName = result['firstName'] ?? _firstName;
                          _lastName = result['lastName'] ?? _lastName;
                          _gender = result['gender'] ?? _gender;
                          _email = result['email'] ?? _email;
                          _phone = result['phone'] ?? _phone;
                          _dob = result['dob'] ?? _dob;
                          _state = result['state'] ?? _state;
                          _city = result['city'] ?? _city;
                          _aadhar = result['aadhar'] ?? _aadhar;
                          _license = result['license'] ?? _license;
                          // Update other fields as needed
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 35),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.mail),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_email',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.male),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_gender',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_phone',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date of Birth:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_dob',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_city_outlined),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'State:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_state',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_city',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.numbers),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aadhar:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_aadhar',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.car_rental),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'License:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$_license',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    // Sign out from Firebase
                    await FirebaseAuth.instance.signOut();
                    // Navigate to AuthGate after sign-out
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AuthGate()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Logout', style: TextStyle(fontSize: 16)),
                ),
              ),
              // ... (other profile information remains unchanged)
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
