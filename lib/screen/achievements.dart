import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AchievementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: Color(0xff2C3E50),
                borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: color1,
              ),
            )),
        title: Text(
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
            Text(
              '"Success is no accident. It is hard work, perseverance, learning, studying, sacrifice and most of all, love of what you are doing or learning to do." - Pelé',
              style: TextStyle(
                fontSize: 16,
                color: color2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Latest Achievement",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
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
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Completed 7 Days of Meditation",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text("Earned on: 2023-09-25"),
                      ])
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Meditation Champion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              "Completed 100 sessions",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 10),
            Text(
              "Streak Master",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              "Maintained a 30-day streak",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 10),
            Text(
              "Mindful Athlete",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              "Practiced 20 sports-focused meditations",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 30),
            Text(
              "Badges and Awards",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              BadgeWidget(
                label: "Gold Medal",
                Imagepath: "assets/ach.png",
              ),
              SizedBox(
                width: 5,
              ),
              BadgeWidget(
                label: "Silver Star",
                Imagepath: "assets/star.png",
              ),
            ]),
            SizedBox(
              height: 8,
            ),
            Row(children: [
              BadgeWidget(
                label: "Bronze Trophy",
                Imagepath: "assets/star.png",
              ),
              SizedBox(
                width: 5,
              ),
              BadgeWidget(
                label: "Participation Badge",
                Imagepath: "assets/Calendar 2.png",
              ),
            ]),
            Spacer(),
            CustomButton(
                height: 50,
                width: 358,
                child: Text(
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

  BadgeWidget({required this.label, required this.Imagepath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          width: 172,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff2C3E50),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 24, width: 24, child: Image.asset(Imagepath)),
                SizedBox(height: 8),
                Text(label, style: TextStyle(fontSize: 12, color: color1)),
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
