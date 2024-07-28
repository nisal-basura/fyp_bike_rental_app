import 'package:flutter/material.dart';

class BikeDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> vehicleDetails;

  BikeDetailsScreen({required this.vehicleDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6F2FF), // Light blue background
      appBar: AppBar(
        title: Text(vehicleDetails['modelOfBike']),
        backgroundColor: Color(0xFF003366),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF003366), // Dark blue background for the image
              child: Column(
                children: [
                  Image.network(vehicleDetails['vehiclePhotos']['front'].path, height: 200, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  Text(
                    vehicleDetails['modelOfBike'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_half, color: Colors.yellow),
                      SizedBox(width: 10),
                      Text('4.5', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(Icons.motorcycle, 'HELMETS: 1 OR 2', vehicleDetails['details']['hasHelmet']),
                  _buildDetailRow(Icons.medical_services, 'FIRST-AID KIT', vehicleDetails['details']['hasFirstAidKit']),
                  _buildDetailRow(Icons.settings, 'TRANSMISSION', vehicleDetails['details']['hasTransmission']),
                  _buildDetailRow(Icons.assistant, '24/7 ROAD SIDE ASSISTANCE', vehicleDetails['details']['hasRoadsideAssistance']),
                  _buildDetailRow(Icons.speed, 'MILEAGE', 'UNLIMITED' as bool),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image for renter
                        radius: 30,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Renter Name', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Renter'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Bike Specifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSpecificationCard('Max Power', '720 W'),
                      _buildSpecificationCard('Top Speed', '120km/hr'),
                      _buildSpecificationCard('Fuel Type', 'Gasoline'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Book Now button press
                      },
                      child: Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
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
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF003366)),
          SizedBox(width: 10),
          Text(
            '$label: ${value ? 'YES' : 'NO'}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationCard(String title, String value) {
    return Card(
      color: Color(0xFF003366),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
