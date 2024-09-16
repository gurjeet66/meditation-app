import 'package:firebaseseries/screen/onboarding2.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class onboarding1 extends StatefulWidget {
  const onboarding1({super.key});

  @override
  State<onboarding1> createState() => _onboarding1State();
}

class _onboarding1State extends State<onboarding1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imagePositionAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _imagePositionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

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
    // Positions of images relative to the cricket image
    final double cricketTop = 160;
    final double cricketLeft = 75;

    final double basketballRight = 40;
    final double basketballTop = 60;
    final double tennisLeft = 20;
    final double tennisTop = 30;
    final double soccerRight = 50;
    final double soccerTop = 230;

    return SafeArea(
      child: Scaffold(
        backgroundColor: color2,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            // Animated images starting behind the cricket image
            AnimatedBuilder(
              animation: _imagePositionAnimation,
              builder: (context, child) {
                double animationValue = _imagePositionAnimation.value;

                return Stack(
                  children: [
                    // Background images moving to their respective positions
                    Positioned(
                      top: cricketTop +
                          (animationValue * (basketballTop - cricketTop)),
                      right: cricketLeft -
                          (animationValue * (cricketLeft - basketballRight)),
                      child: Image.asset(
                        "assets/designers_28349_A_realistic_image_of_a_basketball_player_in_a_55035ec4-eb67-4348-9fa8-510c9a74d1db_1 1.png",
                        width: 150, // Adjust the size if needed
                        height: 150, // Adjust the size if needed
                      ),
                    ),
                    Positioned(
                      top: cricketTop +
                          (animationValue * (tennisTop - cricketTop)),
                      left: cricketLeft -
                          (animationValue * (cricketLeft - tennisLeft)),
                      child: Image.asset(
                        "assets/designers_28349_A_realistic_image_of_a_tennis_player_in_mid-a_c961ce2a-f214-4ef2-9dde-569cb76d38aa_0 (1) 1.png",
                        width: 150, // Adjust the size if needed
                        height: 150, // Adjust the size if needed
                      ),
                    ),
                    Positioned(
                      top: cricketTop +
                          (animationValue * (soccerTop - cricketTop)),
                      right: cricketLeft -
                          (animationValue * (cricketLeft - soccerRight)),
                      child: Image.asset(
                        "assets/designers_28349_A_realistic_image_of_a_soccer_player_in_mid-a_3e08542e-776d-451a-a633-6d64d78df3c5_1 1.png",
                        width: 150, // Adjust the size if needed
                        height: 150, // Adjust the size if needed
                      ),
                    ),
                  ],
                );
              },
            ),

            // Cricket player image (stays in place and on top)
            Positioned(
              top: cricketTop,
              left: cricketLeft,
              child: Image.asset(
                "assets/designers_28349_A_realistic_image_of_a_cricket_player_in_acti_5f5bdbcf-76c2-4af8-aab5-aa16ddbd30a0_3 1.png",
                width: 150, // Adjust the size if needed
                height: 150, // Adjust the size if needed
              ),
            ),

            // Text widgets sliding in from the left
            Positioned(
              top: 370,
              left: 20,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1.5, 0), // Start off-screen to the left
                  end: Offset(0, 0), // Final position
                ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                ),
                child: Text(
                  "Train Your Mind,",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 32, color: color1),
                ),
              ),
            ),
            Positioned(
              top: 405,
              left: 20,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1.5, 0), // Start off-screen to the left
                  end: Offset(0, 0), // Final position
                ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                ),
                child: Text(
                  "Elevate Your Game",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 32, color: color1),
                ),
              ),
            ),

            // Text widgets sliding in from the right
            Positioned(
              top: 450,
              left: 19,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.5, 0), // Start off-screen to the right
                  end: Offset(0, 0), // Final position
                ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                ),
                child: Text(
                  "Discover how tailored meditation practices can",
                  style: TextStyle(fontSize: 16, color: color4),
                ),
              ),
            ),
            Positioned(
              top: 470,
              left: 20,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.5, 0), // Start off-screen to the right
                  end: Offset(0, 0), // Final position
                ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                ),
                child: Text(
                  "help you overcome stress, anxiety, and",
                  style: TextStyle(fontSize: 16, color: color4),
                ),
              ),
            ),
            Positioned(
              top: 490,
              left: 19,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.5, 0), // Start off-screen to the right
                  end: Offset(0, 0), // Final position
                ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                ),
                child: Text(
                  "depression and enhance your athletic",
                  style: TextStyle(fontSize: 16, color: color4),
                ),
              ),
            ),
            Positioned(
              top: 510,
              left: 19,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.5, 0), // Start off-screen to the right
                  end: Offset(0, 0), // Final position
                ).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                ),
                child: Text(
                  "performance.",
                  style: TextStyle(fontSize: 16, color: color4),
                ),
              ),
            ),

            // Button appearing from center
            Positioned(
              top: 600,
              left: 30,
              child: FadeTransition(
                opacity: _imagePositionAnimation,
                child: SizedBox(
                  width: 300, // Button width
                  height: 55, // Button height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color3, // Custom background color
                      foregroundColor: color1, // Text color
                      padding: EdgeInsets.symmetric(vertical: 15), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 18, color: color2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class onboarding1 extends StatefulWidget {
//   const onboarding1({super.key});

//   @override
//   State<onboarding1> createState() => _onboarding1State();
// }

// class _onboarding1State extends State<onboarding1> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: color2,
//         body: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned(
//               right: 55,
//               top: 60,
//               child: Image.asset(
//                   "assets/designers_28349_A_realistic_image_of_a_basketball_player_in_a_55035ec4-eb67-4348-9fa8-510c9a74d1db_1 1.png"),
//             ),
//             Positioned(
//               top: 30,
//               left: 20,
//               child: Image.asset(
//                   "assets/designers_28349_A_realistic_image_of_a_tennis_player_in_mid-a_c961ce2a-f214-4ef2-9dde-569cb76d38aa_0 (1) 1.png"),
//             ),
//             Positioned(
//               top: 230,
//               right: 80,
//               child: Image.asset(
//                   "assets/designers_28349_A_realistic_image_of_a_soccer_player_in_mid-a_3e08542e-776d-451a-a633-6d64d78df3c5_1 1.png"),
//             ),
//             Positioned(
//               top: 160,
//               left: 75,
//               child: Image.asset(
//                   "assets/designers_28349_A_realistic_image_of_a_cricket_player_in_acti_5f5bdbcf-76c2-4af8-aab5-aa16ddbd30a0_3 1.png"),
//             ),

//             // Text widgets for heading and description (unchanged)
//             Positioned(
//                 top: 370,
//                 left: 20,
//                 child: Text(
//                   "Train Your Mind,",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600, fontSize: 32, color: color1),
//                 )),
//             Positioned(
//                 top: 405,
//                 left: 20,
//                 child: Text("Elevate Your Game",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 32,
//                         color: color1))),
//             Positioned(
//               top: 450,
//               left: 19,
//               child: Text(
//                 "Discover how tailored meditation practices can",
//                 style: TextStyle(fontSize: 16, color: color4),
//               ),
//             ),
//             Positioned(
//                 top: 470,
//                 left: 20,
//                 child: Text(
//                   "help you overcome stress, anxiety, and",
//                   style: TextStyle(fontSize: 16, color: color4),
//                 )),
//             Positioned(
//                 top: 490,
//                 left: 19,
//                 child: Text(
//                   "depression and enhance your athletic",
//                   style: TextStyle(fontSize: 16, color: color4),
//                 )),
//             Positioned(
//                 top: 510,
//                 left: 19,
//                 child: Text(
//                   "performance.",
//                   style: TextStyle(fontSize: 16, color: color4),
//                 )),

//             // Updated ElevatedButton with proper size and color
//             Positioned(
//                 top: 600,
//                 left: 30,
//                 child: SizedBox(
//                   width: 300, // Button width
//                   height: 55, // Button height
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => onboarding2()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: color3, // Custom background color
//                       foregroundColor: color1, // Text color
//                       padding: EdgeInsets.symmetric(
//                           vertical: 15), // Padding inside the button
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.circular(12), // Rounded corners
//                       ),
//                     ),
//                     child: Text("Next",
//                         style: TextStyle(fontSize: 18, color: color2)),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
