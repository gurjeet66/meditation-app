import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:flutter/material.dart';
import 'package:firebaseseries/screen/Quickmeditation.dart';
import 'package:firebaseseries/screen/widgets/sessionbox3.dart'; // Update the import if needed

class SessionsScreen extends StatefulWidget {
  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  final List<String> title1 = [
    "Pre-Match Stress",
    "Post-Match Depression",
    "Building Mental Resilience",
    "Focus and Concentration",
    "Recovery and Relaxation",
    "Boosting Energy Levels",
    "Regaining Confidence",
    "Easing Muscle Tension",
    "Mental Clarity and Focus",
    "Bhramari (Bee Breath)",
    "Emotional Cleansing and\n Clarity",
    "Cold Exposure and \nBreath Control",
    "Repetitive Chanting for\n Mental Fortitude",
  ];
  final List<String> subtitle1 = [
    "Pranayama (Breath Control)",
    "Yoga Nidra (Guided Relaxation)",
    "Warrior Poses Sequence ",
    "Dhyana (Meditation)",
    "Supta Baddha Konasana",
    "Surya Namaskar",
    "Vrksasana (Tree Pose)",
    "Balasana (Child’s Pose)",
    "Anulom Vilom (Alternate\n Nostril Breathing)",
    "Bhramari (Bee Breath)",
    "Kirtan Kriya",
    "Wimhoff Meditation",
    "Daimoku",
  ];
  final List<String> lowertext1 = [
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
    "Meditation · 5 min",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Meditation Library',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                Row(
                  children: [
                    _buildCategoryButton(
                      'Tennis',
                      Colors.orange,
                      "assets/Vector.png",
                      imagePadding: EdgeInsets.only(right: 110),
                      textPadding: EdgeInsets.only(right: 100),
                    ),
                    SizedBox(width: 10),
                    _buildCategoryButton(
                      'Soccer',
                      Colors.white,
                      border: true,
                      "assets/mdi_soccer 2.png",
                      imagePadding: EdgeInsets.only(right: 110),
                      textPadding: EdgeInsets.only(right: 100),
                    ),
                  ],
                ),
                _buildCategoryButton(
                  'Cricket',
                  Colors.blue,
                  "assets/mdi_cricket.png",
                  imagePadding: EdgeInsets.only(right: 110),
                  textPadding: EdgeInsets.only(right: 100),
                ),
                _buildCategoryButton(
                  'Basketball',
                  Colors.green,
                  "assets/mdi_basketball.png",
                  imagePadding: EdgeInsets.only(right: 110),
                  textPadding: EdgeInsets.only(right: 80),
                ),
                _buildCategoryButton(
                  'Pre-Match Stress Relief',
                  Color(0xff293C4F),
                  "assets/Frame 2641.png",
                  imagePadding: EdgeInsets.only(right: 110),
                  textPadding: EdgeInsets.only(right: 10, top: 3),
                ),
                _buildCategoryButton(
                  'Post-Match Recovery',
                  Color(0xff293C4F),
                  "assets/Sounds.png",
                  imagePadding: EdgeInsets.only(right: 115),
                  textPadding: EdgeInsets.only(right: 21, top: 3),
                ),
                _buildCategoryButton(
                  'Focus Improvement',
                  Color(0xff293C4F),
                  "assets/Calendar.png",
                  imagePadding: EdgeInsets.only(right: 120),
                  textPadding: EdgeInsets.only(right: 30, top: 5),
                ),
                _buildCategoryButton(
                  'Mindfulness Training',
                  Color(0xff293C4F),
                  "assets/Calendar 2.png",
                  imagePadding: EdgeInsets.only(right: 120),
                  textPadding: EdgeInsets.only(right: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Meditation Habits',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Insight into your habits",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000080)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHabitStat('Time Spent', '2 hours', '+15%'),
                _buildHabitStat('Frequency', '5 sessions', '-10%'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Sessions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Adjusted to wrap ListView.builder with a Container for fixed height

            // Adjust height as needed
            Column(
                children: List.generate(
                    title1.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(6),
                          child: SessionBoxScreen3(
                            titletext: title1[index],
                            subtitletext: subtitle1[index],
                            lowertext: lowertext1[index],
                            Image1:
                                "assets/Depth 4, Frame 1.png", // Adjust as needed
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Quickmeditation(),
                                ),
                              );
                            },
                          ),
                        ))),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Post- Meditation \nReflection",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Progress Summary",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Breath- Holding Time :2 minutes",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Focus level :8\10",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Progress Graph",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      width: 350,
                      height: 54,
                      child: Text("Listen to Audio Recap"),
                      onPressed: () {}),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tips for Improvement",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Next session, focus on extending \nyour breath-holding time.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    String label,
    Color color,
    String imagePath, {
    bool border = false,
    required EdgeInsets imagePadding,
    required EdgeInsetsGeometry textPadding,
  }) {
    return Container(
      width: 170, // Fixed width for consistency
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: border ? Border.all(color: Colors.black) : null,
      ),
      child: Column(
        children: [
          Padding(
            padding: imagePadding,
            child: Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
          ),
          Padding(
            padding: textPadding,
            child: Text(
              label,
              style: TextStyle(
                color: border ? Colors.black : Colors.white,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitStat(String title, String value, String change) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 170, // Fixed width for consistency
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              change,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:firebaseseries/screen/utils/app_colors.dart';
// import 'package:firebaseseries/screen/widgets/sessionbox3.dart';
// import 'package:flutter/material.dart';

// class sessionscreen extends StatefulWidget {
//   @override
//   _sessionscreenState createState() => _sessionscreenState();
// }

// class _sessionscreenState extends State<sessionscreen> {
//   final List title1 = [
//     "Pre-Match Stress",
//     "Post-Match Depression",
//     "Building Mental Resilience",
//     "Focus and Concentration",
//   ];
//   final List subtitle1 = [
//     "Pranayama (Breath Control)",
//     "Yoga Nidra (Guided Relaxation)",
//     "Warrior Poses Sequence ",
//     "Dhyana (Meditation)",
//   ];
//   final List lowertext1 = [
//     "Meditation · 5 min",
//     "Meditation · 5 min",
//     "Meditation · 5 min",
//     "Meditation · 5 min",
//   ];
//   final List images = [
//     "assets/Depth 4, Frame 1.png",
//     "assets/Depth 4, Frame 1.png",
//     "assets/Depth 4, Frame 1.png",
//     "assets/Depth 4, Frame 1.png",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         title: Text(
//           'Meditation Library',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 12,
//                 children: [
//                   Row(
//                     children: [
//                       _buildCategoryButton(
//                         'Tennis',
//                         Colors.orange,
//                         "assets/Vector.png",
//                         imagePadding: EdgeInsets.only(right: 110),
//                         textPadding: EdgeInsets.only(right: 100),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       _buildCategoryButton(
//                         'Soccer',
//                         Colors.white,
//                         border: true,
//                         "assets/mdi_soccer 2.png",
//                         imagePadding: EdgeInsets.only(right: 110),
//                         textPadding: EdgeInsets.only(right: 100),
//                       ),
//                     ],
//                   ),
//                   _buildCategoryButton(
//                     'Cricket',
//                     Colors.blue,
//                     "assets/mdi_cricket.png",
//                     imagePadding: EdgeInsets.only(right: 110),
//                     textPadding: EdgeInsets.only(right: 100),
//                   ),
//                   _buildCategoryButton(
//                       'Basketball', Colors.green, "assets/mdi_basketball.png",
//                       imagePadding: EdgeInsets.only(right: 110),
//                       textPadding: EdgeInsets.only(right: 80)),
//                   _buildCategoryButton(
//                     'Pre-Match Stress Relief',
//                     Color(0xff293C4F),
//                     "assets/Frame 2641.png",
//                     imagePadding: EdgeInsets.only(right: 110),
//                     textPadding: EdgeInsets.only(right: 10, top: 3),
//                   ),
//                   _buildCategoryButton(
//                     'Post-Match Recovery',
//                     Color(0xff293C4F),
//                     "assets/Sounds.png",
//                     imagePadding: EdgeInsets.only(right: 115),
//                     textPadding: EdgeInsets.only(right: 21, top: 3),
//                   ),
//                   _buildCategoryButton(
//                     'Focus Improvement',
//                     Color(0xff293C4F),
//                     "assets/Calendar.png",
//                     imagePadding: EdgeInsets.only(right: 120),
//                     textPadding: EdgeInsets.only(right: 30, top: 5),
//                   ),
//                   _buildCategoryButton(
//                     'Mindfulness Training',
//                     Color(0xff293C4F),
//                     "assets/Calendar 2.png",
//                     imagePadding: EdgeInsets.only(right: 120),
//                     textPadding: EdgeInsets.only(right: 30),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Meditation Habits',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Insight into your habits",
//                 style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xff000080)),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildHabitStat('Time Spent', '2 hours', '+15%'),
//                   _buildHabitStat('Frequency', '5 sessions', '-10%'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Sessions',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 height: 1000,
//                 child: ListView.builder(
//                     itemCount: title1.length,
//                     itemBuilder: (context, index) {
//                       SessionBoxScreen3(
//                           titletext: title1[index],
//                           subtitletext: subtitle1[index],
//                           lowertext: lowertext1[index],
//                           onpressed: () {},
//                           Image1: images[index]);
//                     } // Add more session cards as necessary

//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryButton(
//     String label,
//     Color color,
//     String imagePath,
//     // EdgeInsetsGeometry imagePadding, // Padding for the image
//     //  EdgeInsetsGeometry textPadding,
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

//   Widget _buildHabitStat(String title, String value, String change) {
//     return Material(
//       elevation: 4, // Add elevation to simulate a card-like appearance
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: 170,
//         height: 100,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             Text(
//               value,
//               style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               change,
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSessionCard(String sessionName) {
//     return Card(
//       child: ListTile(
//         title: Text(sessionName),
//       ),
//     );
//   }
// }
