import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'reg2renter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Rental App',
      theme: ThemeData(
        primaryColor: Color(0xFF2199FB),
      ),
      home: CreateProfileScreen2(),
    );
  }
}

class CreateProfileScreen2 extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen2> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _secondaryPhoneController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstNameController.text = prefs.getString('firstName') ?? '';
      _lastNameController.text = prefs.getString('lastName') ?? '';
      _dobController.text = prefs.getString('dob') ?? '';
      _genderController.text = prefs.getString('gender') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _secondaryPhoneController.text = prefs.getString('secondaryPhone') ?? '';
      _addressLine1Controller.text = prefs.getString('addressLine1') ?? '';
      _addressLine2Controller.text = prefs.getString('addressLine2') ?? '';
      _cityController.text = prefs.getString('city') ?? '';
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', _firstNameController.text);
    await prefs.setString('lastName', _lastNameController.text);
    await prefs.setString('dob', _dobController.text);
    await prefs.setString('gender', _genderController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('secondaryPhone', _secondaryPhoneController.text);
    await prefs.setString('addressLine1', _addressLine1Controller.text);
    await prefs.setString('addressLine2', _addressLine2Controller.text);
    await prefs.setString('city', _cityController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Create Your Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF0D47A1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'First name',
                            controller: _firstNameController,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField(
                            'Last name',
                            controller: _lastNameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'Date of Birth',
                      controller: _dobController,
                      suffixIcon: Icons.calendar_today,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'Gender',
                      controller: _genderController,
                      suffixIcon: Icons.arrow_drop_down,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'Email',
                      controller: _emailController,
                      suffixIcon: Icons.email,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'Secondary Phone Number',
                      controller: _secondaryPhoneController,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'Address Line1',
                      controller: _addressLine1Controller,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'Address Line2',
                      controller: _addressLine2Controller,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      'City',
                      controller: _cityController,
                      suffixIcon: Icons.arrow_drop_down,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfilePage()), // Navigate to rider login screen
                        );
                        _saveUserData();
                        // Add your navigation code here
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFFFC107),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {TextEditingController? controller, IconData? suffixIcon}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}
