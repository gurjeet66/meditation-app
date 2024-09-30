import 'package:firebaseseries/screen/achievements.dart';
import 'package:firebaseseries/screen/meditationtask.dart';
import 'package:firebaseseries/screen/meditationtrackerscreen.dart';
import 'package:firebaseseries/screen/progress1.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Explore',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ExploreOption(
                imagePath: "assets/vector 5.png",
                text: 'Progress Tracking',
                onTap2: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressScreen()));
                }, onTap1: () { 
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressScreen()));
                 },
              ),
              ExploreOption(
                imagePath: "assets/mdi_achievement-outline.png",
                text: 'Achievement',
                onTap2: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AchievementScreen()));
                }, onTap1: () { 
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AchievementScreen()));
                }
                 
              ),
              ExploreOption(
                imagePath: "assets/mdi_achievement-outline.png",
                text: 'Challenge',
                onTap2: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeditationTask()));
                }, onTap1: () { 
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeditationTask()));
                 },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreOption extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const ExploreOption({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap2,
   required this.onTap1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Row(
          children: [
            Material(
              elevation: 10, // Add elevation for shadow effect
              borderRadius: BorderRadius.circular(30),
              child: GestureDetector(
                onTap:onTap1 ,
                child: Container(
                  height: 44,
                  width: 299,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Image.asset(
                        imagePath,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            InkWell(
              onTap: onTap2,
              child: Container(
                height: 42,
                width: 42,
                decoration:
                    const BoxDecoration(color: color6, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: color1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
