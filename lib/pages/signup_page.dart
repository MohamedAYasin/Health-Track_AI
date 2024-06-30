import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key, required this.setAuthenticated});

  final Function setAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Account', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full name',
                hintText: 'Enter your full name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFECF1FF), // Background color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: '*****************',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off),
                filled: true,
                fillColor: Color(0xFFECF1FF), // Background color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@example.com',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFECF1FF), // Background color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                hintText: 'Enter your mobile number',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFECF1FF), // Background color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Date Of Birth',
                hintText: 'DD / MM / YYY',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFECF1FF), // Background color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'By continuing, you agree to ',
                style: const TextStyle(color: Colors.black54),
                children: [
                  TextSpan(
                    text: 'Terms of Use',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Terms of Use tap
                      },
                  ),
                  const TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Privacy Policy tap
                      },
                  ),
                  const TextSpan(
                    text: '.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setAuthenticated();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
                child: Text('or sign up with',
                    style: TextStyle(color: Colors.black54))),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      const FaIcon(FontAwesomeIcons.google, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fingerprint, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: 'Log In',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(
                                      setAuthenticated: setAuthenticated,
                                    )),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
