//Loginpage
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image with Blur Effect
            Image.asset(
              'assets/background_image.jpg', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
            // Blurred Overlay
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color:
                    Colors.black.withOpacity(0.3), // Adjust opacity as needed
              ),
            ),
            // Scrollable Content
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  // Login Text
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  // Email Field
                  _buildTextField(context,
                      hint: 'Email Address', obscureText: false),
                  SizedBox(height: 20),
                  // Password Field
                  _buildTextField(context, hint: 'Password', obscureText: true),
                  SizedBox(height: 20),
                  // Remember Me and Forgot Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (bool? newValue) {
                                // Handle Remember Me
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        TextButton(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            // Handle Forgot Password
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18.0)),
                      onPressed: () {
                        // Handle Login
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Or login with
                  Center(
                    child: Text(
                      'Or login with',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Social Icons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSocialIcon(Icons.g_translate, 'G'),
                        _buildSocialIcon(Icons.apple, 'Apple'),
                        _buildSocialIcon(Icons.facebook, 'F'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Sign up
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Handle Sign Up
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 16.0,
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

  Widget _buildTextField(BuildContext context,
      {required String hint, required bool obscureText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white24,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 18),
      label: Text(label),
      onPressed: () {
        // Social Login
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent, // Text/icon color
        side:
            BorderSide(color: Colors.white, width: 1), // Border color and width
        shape: CircleBorder(),
      ),
    );
  }
}
