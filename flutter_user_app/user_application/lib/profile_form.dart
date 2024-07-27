// import 'package:flutter/material.dart';
// import 'create_accountp2.dart'; // Ensure this import is correct based on your file structure

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profile Form',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ProfileForm(),
//     );
//   }
// }

// class ProfileForm extends StatefulWidget {
//   @override
//   _ProfileFormState createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _addressLine1Controller = TextEditingController();
//   final _addressLine2Controller = TextEditingController();

//   String? _selectedGender;
//   String? _selectedCountry;
//   String? _selectedCity;
//   DateTime? _selectedDateOfBirth;

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _phoneNumberController.dispose();
//     _addressLine1Controller.dispose();
//     _addressLine2Controller.dispose();
//     super.dispose();
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDateOfBirth)
//       setState(() {
//         _selectedDateOfBirth = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Your Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               Center(
//                 child: Text(
//                   'About',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: _firstNameController,
//                       decoration: InputDecoration(
//                         labelText: 'First name',
//                         filled: true,
//                         fillColor: const Color.fromARGB(255, 255, 255, 255)
//                             .withOpacity(0.1),
//                         labelStyle: TextStyle(color: Colors.blue),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.orange),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                       ),
//                       cursorColor: Colors.orange,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: TextFormField(
//                       controller: _lastNameController,
//                       decoration: InputDecoration(
//                         labelText: 'Last name',
//                         filled: true,
//                         fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                         labelStyle: TextStyle(color: Colors.blue),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.orange),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                       ),
//                       cursorColor: Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: _selectedDateOfBirth == null
//                       ? 'Date of Birth'
//                       : _selectedDateOfBirth!
//                           .toLocal()
//                           .toString()
//                           .split(' ')[0],
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.calendar_today),
//                     onPressed: () => _selectDate(context),
//                   ),
//                 ),
//                 cursorColor: Colors.orange,
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                 ),
//                 items: ['Male', 'Female', 'Other']
//                     .map((gender) => DropdownMenuItem<String>(
//                           value: gender,
//                           child: Text(gender),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 value: _selectedGender,
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   'Contact Information',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Country of Citizen',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                 ),
//                 items: ['Sri Lanka', 'India', 'USA', 'UK', 'Australia']
//                     .map((country) => DropdownMenuItem<String>(
//                           value: country,
//                           child: Text(country),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedCountry = value;
//                   });
//                 },
//                 value: _selectedCountry,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   suffixIcon: Icon(Icons.email),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 cursorColor: Colors.orange,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _phoneNumberController,
//                 decoration: InputDecoration(
//                   labelText: 'Secondary Phone Number',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 cursorColor: Colors.orange,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _addressLine1Controller,
//                 decoration: InputDecoration(
//                   labelText: 'Address Line1 (in Sri Lanka)',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                 ),
//                 cursorColor: Colors.orange,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _addressLine2Controller,
//                 decoration: InputDecoration(
//                   labelText: 'Address Line2 (in Sri Lanka)',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                 ),
//                 cursorColor: Colors.orange,
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'City',
//                   filled: true,
//                   fillColor: Colors.lightBlueAccent.withOpacity(0.1),
//                   labelStyle: TextStyle(color: Colors.blue),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                 ),
//                 items: ['Colombo', 'Kandy', 'Galle', 'Jaffna', 'Matara']
//                     .map((city) => DropdownMenuItem<String>(
//                           value: city,
//                           child: Text(city),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedCity = value;
//                   });
//                 },
//                 value: _selectedCity,
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProfilePage(
//                             firstName: _firstNameController.text,
//                             lastName: _lastNameController.text,
//                             dateOfBirth: _selectedDateOfBirth,
//                             gender: _selectedGender,
//                             country: _selectedCountry,
//                             email: _emailController.text,
//                             phoneNumber: _phoneNumberController.text,
//                             addressLine1: _addressLine1Controller.text,
//                             addressLine2: _addressLine2Controller.text,
//                             city: _selectedCity,
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                   child: Text('Next'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'create_accountp2.dart'; // Ensure this import is correct based on your file structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileForm(),
    );
  }
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();

  String? _selectedGender;
  String? _selectedCountry;
  String? _selectedCity;
  DateTime? _selectedDateOfBirth;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDateOfBirth) {
      setState(() {
        _selectedDateOfBirth = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003366), // Dark blue background
      appBar: AppBar(
        backgroundColor: Color(0xFF336699), // Match the rounded corners of the form
        title: Text('Create Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Create Your Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First name',
                        filled: true,
                        fillColor: Color(0xFFCCE7FF), // Light blue fill color
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      cursorColor: Colors.orange,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last name',
                        filled: true,
                        fillColor: Color(0xFFCCE7FF), // Light blue fill color
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      cursorColor: Colors.orange,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: _selectedDateOfBirth == null
                      ? 'Date of Birth'
                      : _selectedDateOfBirth!
                          .toLocal()
                          .toString()
                          .split(' ')[0],
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.black),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                cursorColor: Colors.orange,
                validator: (value) {
                  if (_selectedDateOfBirth == null) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                value: _selectedGender,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Country of Citizen',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                items: ['Sri Lanka', 'India', 'USA', 'UK', 'Australia']
                    .map((country) => DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
                value: _selectedCountry,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your country';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: Icon(Icons.email, color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.orange,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Secondary Phone Number',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.phone,
                cursorColor: Colors.orange,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressLine1Controller,
                decoration: InputDecoration(
                  labelText: 'Address Line1 (in Sri Lanka)',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                cursorColor: Colors.orange,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressLine2Controller,
                decoration: InputDecoration(
                  labelText: 'Address Line2 (in Sri Lanka)',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                cursorColor: Colors.orange,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'City',
                  filled: true,
                  fillColor: Color(0xFFCCE7FF), // Light blue fill color
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                items: ['Colombo', 'Kandy', 'Galle', 'Jaffna', 'Matara']
                    .map((city) => DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
                value: _selectedCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC107), // Yellow button color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            dateOfBirth: _selectedDateOfBirth,
                            gender: _selectedGender,
                            country: _selectedCountry,
                            email: _emailController.text,
                            phoneNumber: _phoneNumberController.text,
                            addressLine1: _addressLine1Controller.text,
                            addressLine2: _addressLine2Controller.text,
                            city: _selectedCity,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
