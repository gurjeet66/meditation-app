import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/model/meditationSession.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  int totalMeditationTime = 0;
  int totalMeditationDays = 0;
  int currentStreakDays = 0;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<MeditationSession> _sessions = [];
   @override
  void initState() {
    super.initState();
    _fetchTotalTimeAndDays();
  }
Future<void> _fetchTotalTimeAndDays() async {
  DatabaseReference _dbRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child("userId")
      .child("meditation_session");
  
  _dbRef.once().then((DatabaseEvent snapshot) {
    Map<dynamic, dynamic> data = snapshot.snapshot.value as Map<dynamic, dynamic>;

    setState(() {
      _sessions = data.entries.map((entry) {
        return MeditationSession.fromMap(entry.value);
      }).toList();

      // Calculate total time and days
      totalMeditationTime = _sessions.fold(0, (sum, session) => sum + session.timeSpent);
      totalMeditationDays = _sessions.length;

      // Calculate current streak
      if (_sessions.isNotEmpty) {
        _sessions.sort((a, b) => a.date.compareTo(b.date)); // Sort by date
        DateTime lastDate = _sessions.last.date; // Most recent session
        currentStreakDays = 1; // Start with 1 for the last day

        for (int i = _sessions.length - 2; i >= 0; i--) {
          DateTime currentDate = _sessions[i].date;
          if (lastDate.difference(currentDate).inDays == 1) {
            currentStreakDays++;
            lastDate = currentDate;
          } else {
            break; // Streak is broken
          }
        }
      } else {
        currentStreakDays = 0; // No sessions means no streak
      }
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: const Color(0xff2C3E50),
                borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: color1,
              ),
            )),
        title: const Text(
          "Achievements",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: color2,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: color2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '"Success is no accident. It is hard work, perseverance, learning, studying, sacrifice and most of all, love of what you are doing or learning to do." - Pelé',
              style: TextStyle(
                fontSize: 16,
                color: color2,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Latest Achievement",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 390,
              height: 80,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Completed ${_sessions.length} Days of Meditation",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        
                      ])
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Meditation Champion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
             Text(
              "Completed ${_sessions.length} sessions",
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 10),
            const Text(
              "Streak Master",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
             Text(
              "Maintained a $currentStreakDays streak",
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 10),
            // const Text(
            //   "Mindful Athlete",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16.0,
            //   ),
            // ),
            
            const SizedBox(height: 30),
            // const Text(
            //   "Badges and Awards",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 18.0,
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            //   BadgeWidget(
            //     label: "Gold Medal",
            //     Imagepath: "assets/ach.png",
            //   ),
            //   const SizedBox(
            //     width: 5,
            //   ),
            //   BadgeWidget(
            //     label: "Silver Star",
            //     Imagepath: "assets/star.png",
            //   ),
            // ]),
            // const SizedBox(
            //   height: 8,
            // ),
            // Row(children: [
            //   BadgeWidget(
            //     label: "Bronze Trophy",
            //     Imagepath: "assets/star.png",
            //   ),
            //   const SizedBox(
            //     width: 5,
            //   ),
            //   BadgeWidget(
            //     label: "Participation Badge",
            //     Imagepath: "assets/Calendar 2.png",
            //   ),
            // ]),
            const Spacer(),
            CustomButton(
                height: 50,
                width: 358,
                child: const Text(
                  "Share your Achievements",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  final String label;
  final String Imagepath;

  const BadgeWidget({super.key, required this.label, required this.Imagepath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          width: 172,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff2C3E50),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24, width: 24, child: Image.asset(Imagepath)),
                const SizedBox(height: 8),
                Text(label, style: const TextStyle(fontSize: 12, color: color1)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



// import 'package:firebaseseries/screen/utils/app_colors.dart';
// import 'package:flutter/material.dart';

// class AchievementsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.arrow_back),
//           title: Text(
//             'Achievements',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '"Success is no accident. It is hard work, perseverance, learning, studying, sacrifice and most of all, love of what you are doing or learning to do." - Pelé',
//                 style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Latest Achievement',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(

//                     color: Colors.grey[300],
//                     ),
//                      // Placeholder for an image
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Completed 7 Days of Meditation',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       Text(
//                         'Earned on: 2023-09-25',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               _buildAchievementItem(
//                   'Meditation Champion', 'Completed 100 sessions'),
//               _buildAchievementItem(
//                   'Streak Master', 'Maintained a 30-day streak'),
//               _buildAchievementItem(
//                   'Mindful Athlete', 'Practiced 20 sports-focused meditations'),
//               SizedBox(height: 30),
//               Text(
//                 'Badges and Awards',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               SizedBox(height: 10),
//               Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: [
//                   _buildBadge("Gold Medal","" as Color,imagePadding: EdgeInsets.all(),textPadding: EdgeInsets.all()),
//                   _buildBadge('Silver Star',"",),
//                   _buildBadge('Bronze Trophy',""),
//                   _buildBadge('Participation Badge',""),
//                 ],
//               ),
//               Spacer(),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Share Your Achievements'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/home_icon.png',
//                   height: 24), // Replace with your image
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/achievements_icon.png',
//                   height: 24), // Replace with your image
//               label: 'Achievements',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset('assets/profile_icon.png',
//                   height: 24), // Replace with your image
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAchievementItem(String title, String subtitle) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: TextStyle(fontSize: 16)),
//           Text(subtitle, style: TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }

 
//     Widget _buildBadge(
//     String label,
//     Color color,
//     String imagePath, 
    
//     {
//     bool border = false,
    
//     required EdgeInsets imagePadding,
//     required EdgeInsetsGeometry textPadding,
//   }) {
//     return Container(
//       width: 170,
//       height: 76,
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20),
//         border: border ? Border.all(color: Colors.black) : null,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: imagePadding,
//             child: Image.asset(
//               imagePath,
//               width: 20,
//               height: 20,
//             ),
//           ),
//           Padding(
//             padding: textPadding,
//             child: Text(
//               label,
//               style: TextStyle(
//                 color: border ? Colors.black : Colors.white,
//                 fontSize: 11,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }