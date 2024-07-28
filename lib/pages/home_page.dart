import 'package:flutter/material.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/models/record_model.dart';
import 'package:health_track_ai/widgets/record_card.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<Map<String, String>> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        String username = data['username'] ?? 'User';
        String profileImageUrl = data.containsKey('profileImageUrl') ? data['profileImageUrl'] : 'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80';
        return {'username': username, 'profileImageUrl': profileImageUrl};
      }
    }
    return {
      'username': 'User',
      'profileImageUrl': 'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Records', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: CustomColors.mainBlue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator while fetching
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error if any
          }
          Map<String, String> userData = snapshot.data ?? {'username': 'User', 'profileImageUrl': ''};
          String username = userData['username']!;
          String profileImageUrl = userData['profileImageUrl']!;

          return Column(
            children: [
              Container(
                color: CustomColors.mainBlue, // Egyptian blue
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(profileImageUrl),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hi, welcome back',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                username,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.notifications, color: Colors.blue),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.settings, color: Colors.blue),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return MouseRegion(
                            onEnter: (event) {
                              // Hover effect for changing color
                              // Needs to be implemented
                            },
                            onExit: (event) {
                              // Revert effect for changing color
                              // Needs to be implemented
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.blueAccent,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'][index],
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // Weekly Records title
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Weekly Records',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return RecordCard(
                      record: Record(
                        title: 'Record $index',
                        description: 'Description of record $index',
                        leadingCause: 'Sample Cause',
                        symptom: 'Sample Symptom',
                        mood: 'Sample Mood',
                        started: DateTime.now().toIso8601String(),
                      ),
                      onDelete: () {},
                      onEdit: () {},
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
