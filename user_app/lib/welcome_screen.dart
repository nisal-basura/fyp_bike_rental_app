import 'package:flutter/material.dart';
import 'renter_login_screen.dart';
import 'rider_login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'), // Add your logo asset here
              SizedBox(height: 20),
              Text(
                'Welcome to our Bike Rental App!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Whether you\'re renting out or riding, we\'ve got you covered. List your bike or find your ride with ease. Let\'s pedal together!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RenterLoginScreen()), // Navigate to renter login screen
                  );
                },
                child: Text('Renter'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RiderLoginScreen()), // Navigate to rider login screen
                  );
                },
                child: Text('Rider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
