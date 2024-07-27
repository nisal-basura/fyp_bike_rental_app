import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'reg3renter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  XFile? _profileImage;
  XFile? _nicFront;
  XFile? _nicBack;
  XFile? _addressProof;

  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nicNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nicNumberController.text = prefs.getString('nicNumber') ?? '';
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nicNumber', _nicNumberController.text);
  }

  Future<void> _pickImage(ImageSource source, Function(XFile?) setImage) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      setImage(pickedFile);
    });
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
                      'Upload your Document',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildImagePicker(
                      'Profile Photo',
                      _profileImage,
                      (file) => _profileImage = file,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'NIC',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _buildImagePicker(
                            'Front',
                            _nicFront,
                            (file) => _nicFront = file,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildImagePicker(
                            'Back',
                            _nicBack,
                            (file) => _nicBack = file,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildTextField('NIC Number', controller: _nicNumberController),
                    SizedBox(height: 20),
                    Text(
                      'Confirm Address (Water bill or Electricity bill / If you are a foreigner you can upload hotel bill)',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildImagePicker(
                      'Photo',
                      _addressProof,
                      (file) => _addressProof = file,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VehicleDetailsScreen()), // Navigate to rider login screen
                        );
                        _saveUserData();
                          if (_formKey.currentState!.validate()) {
                            if (_profileImage == null ||
                                _nicFront == null ||
                                _nicBack == null ||
                                _addressProof == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please upload all required images'),
                                ),
                              );
                            } else {
                              _saveUserProfile();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NextScreen(),
                                ),
                              );
                            }
                          }
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
        fillColor: Color(0xFFE0F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }

  Widget _buildImagePicker(String label, XFile? file, Function(XFile?) setImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery, setImage),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: file == null
                ? Center(child: Text('Your Photo', style: TextStyle(color: Colors.grey)))
                : kIsWeb
                    ? Image.network(file.path)
                    : Image.file(File(file.path)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void _saveUserProfile() async {
    await _saveUserData();
    // Save user profile data logic here
    print("Profile Image: ${_profileImage?.path}");
    print("NIC Front: ${_nicFront?.path}");
    print("NIC Back: ${_nicBack?.path}");
    print("Address Proof: ${_addressProof?.path}");
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Next Screen Content'),
      ),
    );
  }
}
