import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button2.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MeditationTrackerScreen extends StatelessWidget {
  const MeditationTrackerScreen({super.key});

  Future<String> getUserName() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userDoc['name'] ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 90),
          child: Text(
            'Athlete Meditation Tracker',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<String>(
        future: getUserName(),
        builder: (context, snapshot) {
          String userName = 'Loading...'; // Default name while loading
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              userName = snapshot.data!;
            } else {
              userName = 'User'; // Fallback name if there's an error
            }
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName, // Display the fetched user name
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Stats Overview',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Overall Progress',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildProgressCard('Total Hours Meditated', '50', '+10%'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildProgressCard('Sessions Completed', '20', '+15%'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton3(
                        child: const Text("Set Reminder"),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        child: const Text("Share Progress"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  "Meditation Tips",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 104,
                  width: 336,
                  child: Row(children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Meditation Breathing',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Practice deep breathing to enhance",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color2),
                        ),
                        const Text(
                          "focus and relaxation",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color2),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey[300],
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Meditation Coach',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProgressCard(String title, String value, String percentage) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                percentage,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
