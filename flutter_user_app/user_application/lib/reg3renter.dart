import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'reg4renter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VehicleDetailsScreen(),
    );
  }
}

class VehicleDetailsScreen extends StatefulWidget {
  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _registrationNoController = TextEditingController();
  final _modelOfBikeController = TextEditingController();
  final _yearOfManufactureController = TextEditingController();
  final _colorController = TextEditingController();

  bool _helmets = false;
  bool _firstAidKit = false;
  bool _transmission = false;
  bool _roadSideAssistance = false;
  bool _mileageUnlimited = false;

  XFile? _vehiclePhoto1;
  XFile? _vehiclePhoto2;
  XFile? _vehiclePhoto3;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _registrationNoController.text = prefs.getString('registrationNo') ?? '';
      _modelOfBikeController.text = prefs.getString('modelOfBike') ?? '';
      _yearOfManufactureController.text = prefs.getString('yearOfManufacture') ?? '';
      _colorController.text = prefs.getString('color') ?? '';
      _helmets = prefs.getBool('helmets') ?? false;
      _firstAidKit = prefs.getBool('firstAidKit') ?? false;
      _transmission = prefs.getBool('transmission') ?? false;
      _roadSideAssistance = prefs.getBool('roadSideAssistance') ?? false;
      _mileageUnlimited = prefs.getBool('mileageUnlimited') ?? false;
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('registrationNo', _registrationNoController.text);
    await prefs.setString('modelOfBike', _modelOfBikeController.text);
    await prefs.setString('yearOfManufacture', _yearOfManufactureController.text);
    await prefs.setString('color', _colorController.text);
    await prefs.setBool('helmets', _helmets);
    await prefs.setBool('firstAidKit', _firstAidKit);
    await prefs.setBool('transmission', _transmission);
    await prefs.setBool('roadSideAssistance', _roadSideAssistance);
    await prefs.setBool('mileageUnlimited', _mileageUnlimited);
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
                        'Details of Vehicle',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildTextField('Registration No', controller: _registrationNoController),
                      SizedBox(height: 10),
                      _buildTextField('Model of Bike', controller: _modelOfBikeController),
                      SizedBox(height: 10),
                      _buildTextField('Year of Manufacture', controller: _yearOfManufactureController),
                      SizedBox(height: 10),
                      _buildTextField('Color', controller: _colorController),
                      SizedBox(height: 20),
                      Text(
                        'Photos of Vehicle',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildImagePicker(
                        'Front',
                        _vehiclePhoto1,
                        (file) => _vehiclePhoto1 = file,
                      ),
                      SizedBox(height: 10),
                      _buildImagePicker(
                        'Side',
                        _vehiclePhoto2,
                        (file) => _vehiclePhoto2 = file,
                      ),
                      SizedBox(height: 10),
                      _buildImagePicker(
                        'Back',
                        _vehiclePhoto3,
                        (file) => _vehiclePhoto3 = file,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Additional Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildCheckboxRow('HELMETS(1 or 2)', _helmets, (value) {
                        setState(() {
                          _helmets = value;
                        });
                      }),
                      _buildCheckboxRow('FIRST-AID KIT', _firstAidKit, (value) {
                        setState(() {
                          _firstAidKit = value;
                        });
                      }),
                      _buildCheckboxRow('TRANSMISSION', _transmission, (value) {
                        setState(() {
                          _transmission = value;
                        });
                      }),
                      _buildCheckboxRow('24/7 ROAD SIDE ASSISTANCE', _roadSideAssistance, (value) {
                        setState(() {
                          _roadSideAssistance = value;
                        });
                      }),
                      _buildCheckboxRow('MILEAGE (Unlimited)', _mileageUnlimited, (value) {
                        setState(() {
                          _mileageUnlimited = value;
                        });
                      }),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UploadVehicleDocumentScreen()), 
                        );
                            if (_formKey.currentState!.validate()) {
                              if (_vehiclePhoto1 == null ||
                                  _vehiclePhoto2 == null ||
                                  _vehiclePhoto3 == null) {
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

  Widget _buildTextField(String hint, {TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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

  Widget _buildCheckboxRow(String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _saveUserProfile() async {
    await _saveUserData();
    // Save user profile data logic here
    print("Registration No: ${_registrationNoController.text}");
    print("Model of Bike: ${_modelOfBikeController.text}");
    print("Year of Manufacture: ${_yearOfManufactureController.text}");
    print("Color: ${_colorController.text}");
    print("Helmets: $_helmets");
    print("First-Aid Kit: $_firstAidKit");
    print("Transmission: $_transmission");
    print("Road Side Assistance: $_roadSideAssistance");
    print("Mileage Unlimited: $_mileageUnlimited");
    print("Vehicle Photo 1: ${_vehiclePhoto1?.path}");
    print("Vehicle Photo 2: ${_vehiclePhoto2?.path}");
    print("Vehicle Photo 3: ${_vehiclePhoto3?.path}");
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


