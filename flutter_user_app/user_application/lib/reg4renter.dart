import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_renter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadVehicleDocumentScreen(),
    );
  }
}

class UploadVehicleDocumentScreen extends StatefulWidget {
  @override
  _UploadVehicleDocumentScreenState createState() => _UploadVehicleDocumentScreenState();
}

class _UploadVehicleDocumentScreenState extends State<UploadVehicleDocumentScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? _incomeLicensePhoto;
  XFile? _insuranceCardPhoto;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController _incomeLicenseExpirationController = TextEditingController();
  final TextEditingController _insuranceCardExpirationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _incomeLicenseExpirationController.text = prefs.getString('incomeLicenseExpiration') ?? '';
      _insuranceCardExpirationController.text = prefs.getString('insuranceCardExpiration') ?? '';
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('incomeLicenseExpiration', _incomeLicenseExpirationController.text);
    await prefs.setString('insuranceCardExpiration', _insuranceCardExpirationController.text);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Upload Vehicle Document',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Income License',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      _buildImagePicker(
                        'Photo',
                        _incomeLicensePhoto,
                        (file) => _incomeLicensePhoto = file,
                      ),
                      SizedBox(height: 10),
                      _buildTextField(
                        'Expiration Date',
                        controller: _incomeLicenseExpirationController,
                        suffixIcon: Icons.calendar_today,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Insurance Card',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      _buildImagePicker(
                        'Photo',
                        _insuranceCardPhoto,
                        (file) => _insuranceCardPhoto = file,
                      ),
                      SizedBox(height: 10),
                      _buildTextField(
                        'Expiration Date',
                        controller: _insuranceCardExpirationController,
                        suffixIcon: Icons.calendar_today,
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WelcomeScreenR()), 
                        );
                            if (_formKey.currentState!.validate()) {
                              if (_incomeLicensePhoto == null || _insuranceCardPhoto == null) {
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
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {TextEditingController? controller, IconData? suffixIcon}) {
    return TextFormField(
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $hint';
        }
        return null;
      },
    );
  }

  Widget _buildImagePicker(String label, XFile? file, Function(XFile?) setImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
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
                ? Center(child: Text('Photo', style: TextStyle(color: Colors.grey)))
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
    print("Income License Photo: ${_incomeLicensePhoto?.path}");
    print("Income License Expiration Date: ${_incomeLicenseExpirationController.text}");
    print("Insurance Card Photo: ${_insuranceCardPhoto?.path}");
    print("Insurance Card Expiration Date: ${_insuranceCardExpirationController.text}");
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
