import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;
  final String dob;
  final String state;
  final String city;
  final String aadhar;
  final String license;

  const EditProfile({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.dob,
    required this.state,
    required this.city,
    required this.aadhar,
    required this.license,

    // Add more parameters as needed
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _aadharController = TextEditingController();
  TextEditingController _licenseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing values
    _firstNameController.text = widget.firstName;
    _lastNameController.text = widget.lastName;
    _genderController.text = widget.gender;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _dobController.text = widget.dob;
    _stateController.text = widget.state;
    _cityController.text = widget.city;
    _aadharController.text = widget.aadhar;
    _licenseController.text = widget.license;
    // Initialize other controllers as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField("First Name", _firstNameController),
              _buildTextField("Last Name", _lastNameController),
              _buildTextField("Gender", _genderController),
              _buildTextField("Phone", _phoneController, TextInputType.phone),
              _buildTextField("Email", _emailController, TextInputType.emailAddress),
              _buildTextField("dob", _dobController),
              _buildTextField("State", _stateController),
              _buildTextField("City", _cityController),
              _buildTextField("Aadhar Number", _aadharController),
              _buildTextField("License", _licenseController),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform account update or submission here
                    // Access data using _firstNameController.text, _lastNameController.text, etc.
                    Navigator.pop(context, {
                      'firstName': _firstNameController.text,
                      'lastName': _lastNameController.text,
                      'gender' : _genderController.text,
                      'email': _emailController.text,
                      'phone': _phoneController.text,
                      'dob' : _dobController.text,
                      'state' : _stateController.text,
                      'city' : _cityController.text,
                      'aadhar' : _aadharController.text,
                      'license' : _licenseController.text,
                      // Add more updated parameters as needed
                    });
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, [TextInputType? inputType]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
