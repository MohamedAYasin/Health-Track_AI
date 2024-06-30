import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/routes/main_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainRouter(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.mainBlue,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/logow.png'),
                height: 100,
              ),
              SizedBox(height: 70),
              Text(
                'Health Track',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 90),
              Text(
                'Your Health, Your Control \n Track and Thrive',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
