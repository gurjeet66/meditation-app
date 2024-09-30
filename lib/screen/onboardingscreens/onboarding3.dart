import 'package:firebaseseries/auth/login.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';

import 'package:flutter/material.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation3;
  late Animation<Offset> _slideAnimation4;

  // State variables to track selected options
  String selectedFrequency = '';
  String selectedChallenge = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation1 = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation2 = Tween<Offset>(
            begin: const Offset(-1.5, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation3 = Tween<Offset>(
            begin: const Offset(-2.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation4 = Tween<Offset>(
            begin: const Offset(-2.5, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

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
            SlideTransition(
              position: _slideAnimation1,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                child: Text(
                  "Sports Meditation",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w600, color: color1),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation2,
              child: const Padding(
                padding: EdgeInsets.only(top: 10, right: 70),
                child: Text(
                  "Let's get to know you better.",
                  style: TextStyle(
                      color: color10,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation2,
              child: const Padding(
                padding: EdgeInsets.only(top: 10, right: 15),
                child: Text(
                  "How often do you engage in sports activities?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: color11),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SlideTransition(
              position: _slideAnimation3,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFrequencyOption("Rarely"),
                    _buildFrequencyOption("Sometimes"),
                    _buildFrequencyOption("Often"),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation3,
              child: const Padding(
                padding: EdgeInsets.only(top: 20, right: 35),
                child: Text(
                  "What are some of the biggest challenges you",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: color12),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation3,
              child: const Padding(
                padding: EdgeInsets.only(top: 2, right: 87),
                child: Text(
                  "face when it comes to being active?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: color12),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation4,
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildChallengeOption("Motivation"),
                    _buildChallengeOption("Time Management"),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation4,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, right: 210),
                child: _buildChallengeOption("Injury prevention"),
              ),
            ),
            const SizedBox(height: 50),
            SlideTransition(
              position: _slideAnimation4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(child: const Text("Skip"), onPressed: () {
                      Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Login()));
                    }),
                    CustomButton1(
                        child: const Text("Continue"),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Login()));
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build frequency option containers
  Widget _buildFrequencyOption(String label) {
    bool isSelected = selectedFrequency == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFrequency = label;
        });
      },
      child: Container(
        height: 47,
        width: label == "Sometimes"
            ? 113
            : label == "Rarely"
                ? 81
                : 71,
        decoration: BoxDecoration(
          color: isSelected ? color2 : color6,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: color8, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  // Method to build challenge option containers
  Widget _buildChallengeOption(String label) {
    bool isSelected = selectedChallenge == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChallenge = label;
        });
      },
      child: Container(
        height: 47,
        width: label == "Time Management" ? 162 : 110,
        decoration: BoxDecoration(
          color: isSelected ? color2 : color6,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: color8, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
