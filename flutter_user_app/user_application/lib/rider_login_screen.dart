import 'package:flutter/material.dart';

class RiderLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Enter your email'),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(hintText: 'Enter your password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
