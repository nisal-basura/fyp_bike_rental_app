// // 

// import 'package:flutter/material.dart';

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
//       home: CreateAccountScreen1(),
//     );
//   }
// }

// class CreateAccountScreen1 extends StatelessWidget {
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
//               // 'assets/image1.png',
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
//                       'Please Enter the 4-digit code sent via SMS to +94---------',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {
//                         // Add your change phone number code here
//                       },
//                       child: Text(
//                         'Change',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFFFFC107),
//                           decoration: TextDecoration.underline,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildCodeBox(),
//                         _buildCodeBox(),
//                         _buildCodeBox(),
//                         _buildCodeBox(),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Didn’t get the code?',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
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

//   Widget _buildCodeBox() {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextField(
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'register_renter.dart';

class CreateAccountScreen1 extends StatelessWidget {
  final String fullPhoneNumber;

  CreateAccountScreen1({required this.fullPhoneNumber});

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
              // 'assets/image1.png',
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
                      'Please Enter the 4-digit code sent via SMS to $fullPhoneNumber',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Add your change phone number code here
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFC107),
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCodeBox(context),
                        _buildCodeBox(context),
                        _buildCodeBox(context),
                        _buildCodeBox(context),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Didn’t get the code?',
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
                                  CreateProfileScreen2()), 
                        );
                        // Add your navigation code here
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

  Widget _buildCodeBox(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
