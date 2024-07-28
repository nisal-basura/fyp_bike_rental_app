import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'vehicle_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VehicleDetailsScreen(vehicles: []),
    );
  }
}

class VehicleDetailsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> vehicles;

  VehicleDetailsScreen({required this.vehicles});

  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _registrationNoController = TextEditingController();
  final _modelOfBikeController = TextEditingController();
  final _yearOfManufactureController = TextEditingController();
  final _colorController = TextEditingController();

  XFile? _vehiclePhoto1;
  XFile? _vehiclePhotoSide;
  XFile? _vehiclePhotoBack;
  final ImagePicker _picker = ImagePicker();

  bool _hasHelmet = false;
  bool _hasFirstAidKit = false;
  bool _hasTransmission = false;
  bool _hasRoadsideAssistance = false;
  bool _hasUnlimitedMileage = false;

  Future<void> _pickImage(ImageSource source, String label) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      switch (label) {
        case 'Front':
          _vehiclePhoto1 = pickedFile;
          break;
        case 'Side':
          _vehiclePhotoSide = pickedFile;
          break;
        case 'Back':
          _vehiclePhotoBack = pickedFile;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 211, 224),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Enter Vehicle Details',
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
                      _buildImagePicker('Front', _vehiclePhoto1, () => _pickImage(ImageSource.gallery, 'Front')),
                      SizedBox(height: 10),
                      _buildImagePicker('Side', _vehiclePhotoSide, () => _pickImage(ImageSource.gallery, 'Side')),
                      SizedBox(height: 10),
                      _buildImagePicker('Back', _vehiclePhotoBack, () => _pickImage(ImageSource.gallery, 'Back')),
                      SizedBox(height: 20),
                      _buildCheckboxRow('HELMETS (1 or 2)', _hasHelmet, (value) {
                        setState(() {
                          _hasHelmet = value!;
                        });
                      }),
                      _buildCheckboxRow('FIRST-AID KIT', _hasFirstAidKit, (value) {
                        setState(() {
                          _hasFirstAidKit = value!;
                        });
                      }),
                      _buildCheckboxRow('TRANSMISSION', _hasTransmission, (value) {
                        setState(() {
                          _hasTransmission = value!;
                        });
                      }),
                      _buildCheckboxRow('24/7 ROAD SIDE ASSISTANCE', _hasRoadsideAssistance, (value) {
                        setState(() {
                          _hasRoadsideAssistance = value!;
                        });
                      }),
                      _buildCheckboxRow('MILEAGE (Unlimited)', _hasUnlimitedMileage, (value) {
                        setState(() {
                          _hasUnlimitedMileage = value!;
                        });
                      }),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Map<String, dynamic> newVehicle = {
                                'registrationNo': _registrationNoController.text,
                                'modelOfBike': _modelOfBikeController.text,
                                'yearOfManufacture': _yearOfManufactureController.text,
                                'color': _colorController.text,
                                'vehiclePhotos': {
                                  'front': _vehiclePhoto1,
                                  'side': _vehiclePhotoSide,
                                  'back': _vehiclePhotoBack,
                                },
                                'details': {
                                  'hasHelmet': _hasHelmet,
                                  'hasFirstAidKit': _hasFirstAidKit,
                                  'hasTransmission': _hasTransmission,
                                  'hasRoadsideAssistance': _hasRoadsideAssistance,
                                  'hasUnlimitedMileage': _hasUnlimitedMileage,
                                },
                              };
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VehicleListScreen(
                                    vehicles: List.from(widget.vehicles)..add(newVehicle),
                                  ),
                                ),
                              );
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

  Widget _buildImagePicker(String label, XFile? file, VoidCallback pickImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: file == null
                ? Center(child: Text(' Photo', style: TextStyle(color: Colors.grey)))
                : kIsWeb
                    ? Image.network(file.path)
                    : Image.file(File(file.path)),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCheckboxRow(String label, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            Text('Yes', style: TextStyle(color: Colors.white)),
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.blue,
            ),
            Text('No', style: TextStyle(color: Colors.white)),
            Checkbox(
              value: !value,
              onChanged: (newValue) {
                onChanged(!newValue!);
              },
              activeColor: Colors.white,
              checkColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
