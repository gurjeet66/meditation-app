import 'package:firebaseseries/screen/login.dart';
import 'package:firebaseseries/screen/onboarding3.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Slide transition from left (-1.0) to the final position (0.0)
    _slideAnimation = Tween<Offset>(begin: Offset(-1.0, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color2,
        body: Column(
          children: [
            // Slide text widgets
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 130),
                child: Text(
                  "Personalize Your",
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w600, color: color1),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text(
                  "Experience",
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w600, color: color1),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text(
                  "How are you feeling right now?",
                  style: TextStyle(
                      fontSize: 20.14,
                      fontWeight: FontWeight.w600,
                      color: color9),
                ),
              ),
            ),

            // Slide image and description widgets
            Row(
              children: [
                Column(
                  children: [
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Container(
                            width: 170,
                            height: 97,
                            child: Image.asset("assets/image8.png")),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 105),
                        child: Text(
                          "Stressed",
                          style: TextStyle(color: color9, fontSize: 12),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 17, top: 3),
                        child: Text(
                          "Stressed before a match",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                          width: 170,
                          height: 97,
                          child: Image.asset("assets/image7.png")),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 130, top: 10),
                        child: Text("Good",
                            style: TextStyle(color: color9, fontSize: 12)),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 90, top: 3),
                        child: Text(
                          "Feeling good",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

            // Additional sliding images and descriptions
            Row(
              children: [
                Column(
                  children: [
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 10),
                        child: Container(
                            height: 97,
                            width: 170,
                            child: Image.asset("assets/Image.png")),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 120),
                        child: Text("Relax",
                            style: TextStyle(color: color9, fontSize: 12)),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 80, top: 3),
                        child: Text(
                          "Need to relax",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 20),
                        child: Container(
                            height: 97,
                            width: 170,
                            child: Image.asset("assets/image12.png")),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 110),
                        child: Text("Excited",
                            style: TextStyle(color: color9, fontSize: 12)),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 70, top: 3),
                        child: Text(
                          "Feeling excited",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, right: 200),
                    child: Container(
                        height: 97,
                        width: 170,
                        child: Image.asset("assets/image 13.png")),
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 320),
                    child: Text("Focused",
                        style: TextStyle(color: color9, fontSize: 12)),
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 280, top: 3),
                    child: Text(
                      "Feeling focused",
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    child: Text("Skip"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }),
                CustomButton1(
                    child: Text("Continue"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Onboarding3()));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:firebaseseries/screen/onboarding3.dart';
// import 'package:firebaseseries/screen/utils/app_colors.dart';
// import 'package:firebaseseries/screen/widgets/button1.dart';
// import 'package:firebaseseries/screen/widgets/button3.dart';
// import 'package:flutter/material.dart';

// class onboarding2 extends StatefulWidget {
//   const onboarding2({super.key});

//   @override
//   State<onboarding2> createState() => _onboarding2State();
// }

// class _onboarding2State extends State<onboarding2> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: color2,
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10, right: 130),
//               child: Text(
//                 "Personalize Your",
//                 style: TextStyle(
//                     fontSize: 32, fontWeight: FontWeight.w600, color: color1),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 220),
//               child: Text(
//                 "Experience",
//                 style: TextStyle(
//                     fontSize: 32, fontWeight: FontWeight.w600, color: color1),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 90),
//               child: Text(
//                 "How are you feeling right now?",
//                 style: TextStyle(
//                     fontSize: 20.14,
//                     fontWeight: FontWeight.w600,
//                     color: color9),
//               ),
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 10),
//                       child: Container(
//                           width: 170,
//                           height: 97,
//                           child: Image.asset("assets/image8.png")),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, right: 105),
//                       child: Text(
//                         "Stressed",
//                         style: TextStyle(color: color9, fontSize: 12),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 17, top: 3),
//                       child: Text(
//                         "Stressed before a match",
//                         style: TextStyle(color: Colors.white54, fontSize: 12),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                         width: 170,
//                         height: 97,
//                         child: Image.asset("assets/image7.png")),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 130, top: 10),
//                       child: Text("Good",
//                           style: TextStyle(color: color9, fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 90, top: 3),
//                       child: Text(
//                         "Feeling good",
//                         style: TextStyle(color: Colors.white54, fontSize: 12),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25, left: 10),
//                       child: Container(
//                           height: 97,
//                           width: 170,
//                           child: Image.asset("assets/Image.png")),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, right: 120),
//                       child: Text("Relax",
//                           style: TextStyle(color: color9, fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 80, top: 3),
//                       child: Text(
//                         "Need to relax",
//                         style: TextStyle(color: Colors.white54, fontSize: 12),
//                       ),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25, left: 10),
//                       child: Container(
//                           height: 97,
//                           width: 170,
//                           child: Image.asset("assets/image12.png")),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, right: 120),
//                       child: Text("Excited",
//                           style: TextStyle(color: color9, fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 80, top: 3),
//                       child: Text(
//                         "Feeling excited",
//                         style: TextStyle(color: Colors.white54, fontSize: 12),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25, right: 200),
//                   child: Container(
//                       height: 97,
//                       width: 170,
//                       child: Image.asset("assets/image 13.png")),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10, right: 320),
//                   child: Text("Focused",
//                       style: TextStyle(color: color9, fontSize: 12)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 280, top: 3),
//                   child: Text(
//                     "Feeling focused",
//                     style: TextStyle(color: Colors.white54, fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomButton(child: Text("Skip"), onPressed: () {}),
//                 CustomButton1(
//                     child: Text("Continue"),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => onboarding3()));
//                     })
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
