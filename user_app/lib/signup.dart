import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Signup UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Replace with your background image asset
          Image.asset(
            'assets/background_image.jpg',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0), // Space for status bar
                  Text('Signup',
                      style: TextStyle(fontSize: 32.0, color: Colors.white)),
                  SizedBox(height: 20.0),
                  _buildTextFormField('User Name'),
                  _buildTextFormField('NIC/ Passport Number'),
                  _buildTextFormField('Email'),
                  _buildTextFormField('Password', isPassword: true),
                  _buildTextFormField('Confirm password', isPassword: true),
                  SizedBox(height: 20.0),
                  _buildSignupButton(context),
                  SizedBox(height: 20.0),
                  Text('Or login with', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 20.0),
                  _buildSocialButtons(),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      // Navigate to signup screen
                    },
                    child: Text('Don’t have an account? Signup',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(String label, {bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon:
            isPassword ? Icon(Icons.visibility_off, color: Colors.white) : null,
      ),
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement sign-up logic
      },
      child: Text('Signup'),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // background color
        onPrimary: Colors.white, // text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSocialButton('G', Colors.white), // Google
        SizedBox(width: 10.0),
        _buildSocialButton('f', Colors.white), // Facebook
      ],
    );
  }

  Widget _buildSocialButton(String text, Color textColor) {
    return TextButton(
      onPressed: () {
        // Implement social login logic
      },
      child: Text(text, style: TextStyle(fontSize: 20.0, color: textColor)),
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
