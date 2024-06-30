import 'package:flutter/material.dart';
import 'package:health_track_ai/routes/auth_router.dart';
import 'package:health_track_ai/routes/logged_router.dart';

class MainRouter extends StatefulWidget {
  const MainRouter({super.key});

  @override
  State<MainRouter> createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  var _isAuthenticated = false;

  void _handleAuthState() {
    setState(() {
      _isAuthenticated = !_isAuthenticated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated
        ? const LoggedRouter()
        : AuthRouter(
            setAuthenticated: _handleAuthState,
          );
  }
}
