// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io';
// import 'reg3renter.dart';

// class VehicleListScreen extends StatefulWidget {
//   @override
//   _VehicleListScreenState createState() => _VehicleListScreenState();
// }

// class _VehicleListScreenState extends State<VehicleListScreen> {
//   List<Vehicle> vehicles = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadVehicles();
//   }

//   Future<void> _loadVehicles() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? imagePath = prefs.getString('vehiclePhoto1');
//     String modelOfBike = prefs.getString('modelOfBike') ?? '';

//     if (imagePath != null && modelOfBike.isNotEmpty) {
//       setState(() {
//         vehicles.add(Vehicle(
//           imageUrl: imagePath,
//           name: modelOfBike,
//           rating: 4.5,
//           availability: 'Available',
//         ));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE0F7FA),
//       appBar: AppBar(
//         title: Text(
//           'Vehicle List',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.black),
//           onPressed: () {
//             // Add your menu logic here
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               ...vehicles.map((vehicle) => VehicleCard(vehicle: vehicle)).toList(),
//               SizedBox(height: 20),
//               AddNewVehicleButton(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: Color(0xFFFFC107),
//         unselectedItemColor: Colors.white,
//         backgroundColor: Color(0xFF0D47A1),
//       ),
//     );
//   }
// }

// class Vehicle {
//   final String imageUrl;
//   final String name;
//   final double rating;
//   final String availability;

//   Vehicle({
//     required this.imageUrl,
//     required this.name,
//     required this.rating,
//     required this.availability,
//   });
// }

// class VehicleCard extends StatelessWidget {
//   final Vehicle vehicle;

//   VehicleCard({required this.vehicle});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Image.file(
//               File(vehicle.imageUrl),
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     vehicle.name,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text(
//                         vehicle.rating.toString(),
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(width: 4),
//                       Icon(Icons.star, color: Colors.amber),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text(
//                         'Availability: ',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       Text(
//                         vehicle.availability,
//                         style: TextStyle(fontSize: 16, color: Colors.green),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add your see more logic here
//                         },
//                         child: Text('See More'),
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.black, backgroundColor: Color(0xFFFFC107),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add your rent logic here
//                         },
//                         child: Text('Rent'),
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.black, backgroundColor: Color(0xFFFFC107),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddNewVehicleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => VehicleDetailsScreen()),
//         );
//       },
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(vertical: 20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.black),
//         ),
//         child: Column(
//           children: [
//             Icon(Icons.add, size: 50, color: Colors.black),
//             SizedBox(height: 8),
//             Text(
//               'Add New',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io';
// import 'reg3renter.dart';

// class VehicleListScreen extends StatefulWidget {
//   @override
//   _VehicleListScreenState createState() => _VehicleListScreenState();
// }

// class _VehicleListScreenState extends State<VehicleListScreen> {
//   List<Vehicle> vehicles = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadVehicles();
//   }

//   Future<void> _loadVehicles() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? imagePath = prefs.getString('vehiclePhoto1');
//     String modelOfBike = prefs.getString('modelOfBike') ?? '';

//     if (imagePath != null && modelOfBike.isNotEmpty) {
//       setState(() {
//         vehicles.add(Vehicle(
//           imageUrl: imagePath,
//           name: modelOfBike,
//           rating: 4.5,
//           availability: 'Available',
//         ));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE0F7FA),
//       appBar: AppBar(
//         title: Text(
//           'Vehicle List',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.black),
//           onPressed: () {
//             // Add your menu logic here
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               ...vehicles.map((vehicle) => VehicleCard(vehicle: vehicle)).toList(),
//               SizedBox(height: 20),
//               AddNewVehicleButton(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: Color(0xFFFFC107),
//         unselectedItemColor: Colors.white,
//         backgroundColor: Color(0xFF0D47A1),
//       ),
//     );
//   }
// }

// class Vehicle {
//   final String imageUrl;
//   final String name;
//   final double rating;
//   final String availability;

//   Vehicle({
//     required this.imageUrl,
//     required this.name,
//     required this.rating,
//     required this.availability,
//   });
// }

// class VehicleCard extends StatelessWidget {
//   final Vehicle vehicle;

//   VehicleCard({required this.vehicle});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Image.file(
//               File(vehicle.imageUrl),
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     vehicle.name,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text(
//                         vehicle.rating.toString(),
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(width: 4),
//                       Icon(Icons.star, color: Colors.amber),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text(
//                         'Availability: ',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       Text(
//                         vehicle.availability,
//                         style: TextStyle(fontSize: 16, color: Colors.green),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add your see more logic here
//                         },
//                         child: Text('See More'),
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.black, 
//                           backgroundColor: Color(0xFFFFC107),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add your rent logic here
//                         },
//                         child: Text('Rent'),
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.black, 
//                           backgroundColor: Color(0xFFFFC107),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddNewVehicleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => VehicleDetailsScreen()),
//         );
//       },
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(vertical: 20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.black),
//         ),
//         child: Column(
//           children: [
//             Icon(Icons.add, size: 50, color: Colors.black),
//             SizedBox(height: 8),
//             Text(
//               'Add New',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
      home: VehicleListScreen(),
    );
  }
}

class VehicleListScreen extends StatefulWidget {
  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  final List<Vehicle> vehicles = [];
  final ImagePicker _picker = ImagePicker();
  XFile? _vehicleImage;
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  void _addVehicle() {
    setState(() {
      vehicles.add(
        Vehicle(
          imageUrl: _vehicleImage?.path ?? '',
          model: _modelController.text,
          rating: double.tryParse(_ratingController.text) ?? 0,
          availability: true,
        ),
      );
      _vehicleImage = null;
      _modelController.clear();
      _ratingController.clear();
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _vehicleImage = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                return VehicleCard(vehicle: vehicles[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Add New Vehicle',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _vehicleImage == null
                        ? Center(child: Text('Tap to add vehicle image'))
                        : Image.file(File(_vehicleImage!.path)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _modelController,
                  decoration: InputDecoration(
                    hintText: 'Model',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _ratingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Rating',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addVehicle,
                  child: Text('Add Vehicle'),
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
        ],
      ),
    );
  }
}

class Vehicle {
  final String imageUrl;
  final String model;
  final double rating;
  final bool availability;

  Vehicle({
    required this.imageUrl,
    required this.model,
    required this.rating,
    required this.availability,
  });
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  VehicleCard({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            vehicle.imageUrl.isEmpty
                ? Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  )
                : Image.file(
                    File(vehicle.imageUrl),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicle.model,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < vehicle.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Availability: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        vehicle.availability ? Icons.check_circle : Icons.cancel,
                        color: vehicle.availability ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // See more button logic
                        },
                        child: Text('See More'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Rent button logic
                        },
                        child: Text('Rent'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
