import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(
        firstName: 'Dasuni',
        lastName: 'Hansika',
        dateOfBirth: DateTime(1995, 5, 20),
        gender: 'Female',
        country: 'Sri Lanka',
        email: 'dasuni@example.com',
        phoneNumber: '1234567890',
        addressLine1: '123 Main St',
        addressLine2: 'Apt 4B',
        city: 'Colombo',
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? country;
  final String email;
  final String phoneNumber;
  final String addressLine1;
  final String addressLine2;
  final String? city;

  ProfilePage({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  XFile? _profileImage;
  XFile? _drivingLicenceFront;
  XFile? _drivingLicenceBack;
  XFile? _nicFront;
  XFile? _nicBack;
  XFile? _addressProof;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, Function(XFile?) setImage) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      setImage(pickedFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload your Document',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildImagePicker(
                  'Profile Photo',
                  _profileImage,
                  (file) => _profileImage = file,
                ),
                _buildImagePicker(
                  'Driving Licence (Front)',
                  _drivingLicenceFront,
                  (file) => _drivingLicenceFront = file,
                ),
                _buildImagePicker(
                  'Driving Licence (Back)',
                  _drivingLicenceBack,
                  (file) => _drivingLicenceBack = file,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Driving Licence Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the driving licence number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date Of Expire',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of expire';
                    }
                    return null;
                  },
                ),
                _buildImagePicker(
                  'NIC/Passport (Front)',
                  _nicFront,
                  (file) => _nicFront = file,
                ),
                _buildImagePicker(
                  'NIC/Passport (Back)',
                  _nicBack,
                  (file) => _nicBack = file,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'NIC/Passport Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the NIC/passport number';
                    }
                    return null;
                  },
                ),
                _buildImagePicker(
                  'Confirm Address (Water bill or Electricity bill)',
                  _addressProof,
                  (file) => _addressProof = file,
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_profileImage == null ||
                            _drivingLicenceFront == null ||
                            _drivingLicenceBack == null ||
                            _nicFront == null ||
                            _nicBack == null ||
                            _addressProof == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Please upload all required images'),
                            ),
                          );
                        } else {
                          _saveUserProfile();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(
                                firstName: widget.firstName,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Finish'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 244, 242, 241),
                      backgroundColor: Color.fromARGB(255, 228, 139, 56),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
      ),
    );
  }

  Widget _buildImagePicker(
      String label, XFile? file, Function(XFile?) setImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery, setImage),
          child: Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[300],
            child: file == null
                ? Center(child: Text('Your Photo'))
                : kIsWeb
                    ? Image.network(file.path)
                    : Image.file(File(file.path)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void _saveUserProfile() {
    // Save user profile data logic here
    print("First Name: ${widget.firstName}");
    print("Last Name: ${widget.lastName}");
    print("Date of Birth: ${widget.dateOfBirth}");
    print("Gender: ${widget.gender}");
    print("Country: ${widget.country}");
    print("Email: ${widget.email}");
    print("Phone Number: ${widget.phoneNumber}");
    print("Address Line 1: ${widget.addressLine1}");
    print("Address Line 2: ${widget.addressLine2}");
    print("City: ${widget.city}");
    print("Profile Image: ${_profileImage?.path}");
    print("Driving Licence Front: ${_drivingLicenceFront?.path}");
    print("Driving Licence Back: ${_drivingLicenceBack?.path}");
    print("NIC Front: ${_nicFront?.path}");
    print("NIC Back: ${_nicBack?.path}");
    print("Address Proof: ${_addressProof?.path}");
  }
}
