// import 'package:flutter/material.dart';
// import 'create_account.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bike Rental App',
//       theme: ThemeData(
//         primaryColor: Color(0xFF2199FB),
//       ),
//       home: CreaterenterAccountScreen(),
//     );
//   }
// }

// class CreaterenterAccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE0F7FA),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(flex: 2),
//               // Image.asset(
//               //   'assets/bike_icon.png', // Make sure to add the image to your assets folder
//               //   height: 150,
//               // ),
//               SizedBox(height: 20),
//               Text(
//                 'R & R',
//                 style: TextStyle(
//                   fontSize: 48,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 'Rent & Ride',
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.black,
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF0D47A1),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Enter Your Mobile Number',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'We will send you a verification code',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: DropdownButton<String>(
//                             value: '+94',
//                             items: <String>['+94', '+1', '+44', '+91'].map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (_) {},
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: TextField(
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                               hintText: 'Phone Number',
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   CreateAccountScreen1()), // Navigate to rider login screen
//                         );
//                         // Add your navigation code here
//                       },
//                       child: Text('Next'),
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Color(0xFFFFC107),
//                         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'create_account.dart';

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
      home: CreaterenterAccountScreen(),
    );
  }
}

class CreaterenterAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreaterenterAccountScreen> {
  String phoneNumber = '';
  String countryCode = '+94';

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
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              // Image.asset(
              //   'assets/bike_logo.png', // Replace with your image asset path
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
                    Icon(
                      Icons.phone_iphone,
                      size: 48,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter Your Mobile Number',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We will send you a verification code',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              // Image.asset(
                              //   'assets/flag.png', // Replace with your flag image asset path
                              //   width: 24,
                              //   height: 24,
                              // ),
                              SizedBox(width: 8),
                              Text(
                                countryCode, // Change this to your country code
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String fullPhoneNumber = '$countryCode$phoneNumber';
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountScreen1(fullPhoneNumber: fullPhoneNumber),
                          ),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
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
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
