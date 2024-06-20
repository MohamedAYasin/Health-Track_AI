import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_track_ai/pages/chat_bot_page.dart';
import 'package:health_track_ai/pages/home_page.dart';
import 'package:health_track_ai/pages/profile_page.dart';
import 'package:health_track_ai/pages/records_page.dart';

class LoggedRouter extends StatefulWidget {
  const LoggedRouter({super.key});

  @override
  State<LoggedRouter> createState() => _NavigationState();
}

class _NavigationState extends State<LoggedRouter> {
  var _selectedIndex = 0;

  static const screens = [
    HomePage(),
    RecordsPage(),
    ChatBotPage(),
    ProfilePage(),
  ];

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: GNav(
                gap: 10,
                backgroundColor: const Color.fromARGB(255, 34, 96, 255),
                color: Colors.white,
                activeColor: Colors.black,
                tabBackgroundColor: const Color.fromARGB(100, 255, 255, 255),
                padding: const EdgeInsets.all(16),
                tabBorderRadius: 40,
                onTabChange: changeScreen,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.calendar_month,
                    text: 'Records',
                  ),
                  GButton(icon: Icons.bubble_chart, text: 'Chat Bot'),
                  GButton(icon: Icons.person, text: 'Profile'),
                ],
              ),
            )),
      ),
    );
  }
}
