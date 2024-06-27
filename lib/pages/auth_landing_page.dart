import 'package:flutter/material.dart';
import 'package:health_track_ai/pages/login_page.dart';
import 'package:health_track_ai/pages/signup_page.dart';

class AuthLandingPage extends StatelessWidget {
  const AuthLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Health Track',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const Text(
                'Your Health, Your Control',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const Text(
                'Track And Thrive',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 90),
              const Text(
                'Track and Thrive with Health-Track AI: Empowering You with AI-Powered Symptom Tracking and Personalized Health Insights for a Healthier, Happier Life.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Log In', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  backgroundColor: Colors.blue.shade100,
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}