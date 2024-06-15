import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_application/welcome_screen.dart';
import 'firebase_options.dart';
// import 'renter_login_screen.dart';
// import 'rider_login_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
