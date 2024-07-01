import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

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
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'John Doe',
                style: TextStyle(
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
                            builder: (context) => EditProfilePage(),
                          ),
                        );
                      } else if (tile.title == 'Logout') {
                        // Implement logout functionality
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
