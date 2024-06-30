import 'package:flutter/material.dart';
import 'package:health_track_ai/pages/auth_landing_page.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key, required this.setAuthenticated});

  final Function setAuthenticated;

  @override
  Widget build(BuildContext context) {
    return AuthLandingPage(
      setAuthenticated: setAuthenticated,
    );
  }
}
