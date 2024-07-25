import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
              TextField(
                decoration: InputDecoration(
                  labelText: 'Driving Licence Number',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Date Of Expire',
                ),
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
              TextField(
                decoration: InputDecoration(
                  labelText: 'NIC/Passport Number',
                ),
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
                    // Handle finish button press
                  },
                  child: Text('Finish'),
                ),
              ),
            ],
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
                : Image.file(File(file.path)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
