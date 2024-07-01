import 'package:flutter/material.dart';
import 'package:health_track_ai/routes/auth_router.dart';
import 'package:health_track_ai/routes/logged_router.dart';

class MainRouter extends StatelessWidget {
  const MainRouter({super.key});

  final _isAuthenticated = true;

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated ? const LoggedRouter() : const AuthRouter();
  }
}