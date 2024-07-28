import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'reg3renter.dart';

class VehicleListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> vehicles;

  VehicleListScreen({required this.vehicles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List'),
        backgroundColor: Color.fromARGB(255, 13, 133, 231),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: vehicles.length + 1,
        itemBuilder: (context, index) {
          if (index == vehicles.length) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehicleDetailsScreen(vehicles: vehicles),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Add New',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return VehicleCard(
            modelOfBike: vehicles[index]['modelOfBike'],
            vehiclePhoto1: vehicles[index]['vehiclePhotos']['front'],
          );
        },
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String modelOfBike;
  final XFile? vehiclePhoto1;

  VehicleCard({required this.modelOfBike, this.vehiclePhoto1});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            vehiclePhoto1 != null
                ? (kIsWeb
                    ? Image.network(
                        vehiclePhoto1!.path,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(vehiclePhoto1!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ))
                : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Icon(Icons.photo, color: Colors.white),
                  ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modelOfBike,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                          backgroundColor: Color(0xFFFFC107),
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
                          backgroundColor: Color(0xFFFFC107),
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
