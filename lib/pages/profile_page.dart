import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore
import 'package:flutter/cupertino.dart';
import 'auth_landing_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> _fetchUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      }
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show loading indicator while fetching
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error if any
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('User data not found.'));
          }

          String username = snapshot.data!['username'] ?? 'User';
          String profileImageUrl = snapshot.data!['profileImageUrl'] ??
              'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80';

          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              ...List.generate(
                customListTiles.length,
                    (index) {
                  final tile = customListTiles[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.black12,
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            tile.icon,
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(tile.title),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // Navigate to corresponding screen based on tile
                          if (tile.title == 'Profile') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditProfilePage(),
                              ),
                            );
                          } else if (tile.title == 'Logout') {
                            // Implement logout functionality
                            FirebaseAuth.instance.signOut().then((value) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthLandingPage(
                                    setAuthenticated: () {},
                                  ),
                                ),
                                    (route) => false,
                              );
                            });
                          } else {
                            // Handle other tiles accordingly
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.person,
    title: 'Profile',
  ),
  CustomListTile(
    icon: Icons.favorite,
    title: 'Favorite',
  ),
  CustomListTile(
    icon: Icons.payment,
    title: 'Payment Method',
  ),
  CustomListTile(
    icon: Icons.privacy_tip,
    title: 'Privacy Policy',
  ),
  CustomListTile(
    icon: Icons.settings,
    title: 'Settings',
  ),
  CustomListTile(
    icon: Icons.help,
    title: 'Help',
  ),
  CustomListTile(
    title: 'Logout',
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
