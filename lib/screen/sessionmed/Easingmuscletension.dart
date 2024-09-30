import 'package:firebaseseries/screen/Sportsmedssteps/Yoganidrasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/balasanasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/daimokusteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/dhayanamed.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/kirtankriyasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/pranayamsteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/suptaBaddhasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/warriorposesteps.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/customexercise.dart';
import 'package:flutter/material.dart';

class Easingmuscletension extends StatefulWidget {
  const Easingmuscletension({super.key});

  @override
  State<Easingmuscletension> createState() => _EasingmuscletensionState();
}

class _EasingmuscletensionState extends State<Easingmuscletension> {
  bool _voiceGuidanceEnabled = false;
  bool _backgroundSoundEnabled = false;
  bool _hapticFeedbackEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        title: const Text(
          'Meditation',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: color2),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
            height: 120,
            width: 370,
            decoration: BoxDecoration(
              color: const Color(0xff151F29),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
                clipBehavior:
                    Clip.none, // Allows elements to overflow the container
                children: [
                  // Left section for text content
                  const Positioned(
                    top: 10,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Easing Muscle Tension ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: color1,
                          ),
                        ),
                        Text(
                          "Balasana (Child's Pose)",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: color1,
                          ),
                        ),
                        Text(
                          "Duration :5 minutes",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: color1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image on the right side
                  Positioned(
                    right: 20,
                    bottom: 5,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("assets/Depth 4, Frame 1.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // Label image (above text)
                ])),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 720,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChoiceCard(
                  title: "Balasana (Child’s Pose) with Gentle Spinal Twists",
                  subtitle: 'Pre-Match Deepression',
                  tags: const [
                    'Releases Tension',
                  ],
                  description:
                      'Releases tension in the back, shoulders, and neck, alleviating strain from weightlifting.',
                  onStart: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Balasana()));
                  },
                ),
              ],
            ),
          ),
        ),
      ])),
    ));
  }
}
