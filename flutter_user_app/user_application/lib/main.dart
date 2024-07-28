import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'welcome_screen.dart';
import 'firebase_options.dart';
import 'log.dart';
import 'renterlog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Rental App',
      theme: ThemeData(
        primaryColor:
            Color(0xFF2199FB), // Use primaryColor instead of primarySwatch,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              // Image.asset(
              //   'assets/bike_icon.png', // Replace with your image asset path
              //   height: 150,
              // ),
              SizedBox(height: 20),
              Text(
                'R & R',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Rent & Ride',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF0D47A1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to our Bike Rental App!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10, width: 200),
                    Text(
                      'Whether you\'re renting out or riding, we\'ve got you covered. List your bike or find your ride with ease. Let\'s pedal together!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreaterenterAccountScreen()), // Navigate to rider login screen
                        );
                        // Add your navigation code here
                      },
                      child: Text('Renter'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFF0D47A1),
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreateAccountScreen()), // Navigate to rider login screen
                        );
                      },
                      child: Text('Rider  '),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFF0D47A1),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
