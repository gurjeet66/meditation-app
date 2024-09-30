import 'package:firebaseseries/screen/Sportsmedssteps/Yoganidrasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/daimokusteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/ohmchantingsteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/pranayamsteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/wimhoffsteps.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/customexercise.dart';
import 'package:flutter/material.dart';

class cricketmeditation extends StatefulWidget {
  const cricketmeditation({super.key});

  @override
  State<cricketmeditation> createState() => _cricketmeditationState();
}

class _cricketmeditationState extends State<cricketmeditation> {
  bool _voiceGuidanceEnabled = false;
  bool _backgroundSoundEnabled = false;
  bool _hapticFeedbackEnabled = false;
   void _saveSettings() {
    // Logic to save the settings (e.g., to SharedPreferences, Firestore)
    print('User settings have been saved!');
  }

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
                      clipBehavior: Clip
                          .none, // Allows elements to overflow the container
                      children: [
                        // Left section for text content
                        const Positioned(
                          top: 10,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Meditation for ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: color1,
                                ),
                              ),
                              Text(
                                "Cricket",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: color1,
                                ),
                              ),
                              Text(
                                "Players",
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
                            width: 150,
                            height: 110,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    "assets/designers_28349_A_realistic_image_of_a_cricket_player_in_acti_5f5bdbcf-76c2-4af8-aab5-aa16ddbd30a0_2.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        // Label image (above text)
                        Positioned(
                          top: 55,
                          left: 110,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    ExactAssetImage("assets/mdi_soccer 2.png"),
                              ),
                            ),
                          ),
                        ),
                      ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 3060,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChoiceCard(
              title: "Pranayama with Nadi Shodhana",
              subtitle: "Pre-Match Deepression",
              tags: const [
                'Stress Management',
                'Breath Control',
                'Focus',
                
              ],
              description:
                  'By alternating between nostrils, it helps improve lung function, promote relaxation, clear blocked energy pathways (nadis), and restore harmony between the left and right hemispheres of the brain, leading to a balanced and centered state of mind.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>pranayamsteps()));
              }, 
            ),
            ChoiceCard(
              title: "Yoga Nidra",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                
                'Deep Relaxation',
                'Recovery',
                'Mental-Clarity'
              ],
              description:
                  'This meditation is highly effective for deep relaxation and recovery,helping athletes to release tension and mental fatigue',
              onStart: () {
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Yoganidrasteps()));
              }, 
            ),
                  
                      const SizedBox(
                        height: 10,
                      ),
                      ChoiceCard(
              title: "Ohm Chnating",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Mental Balance',
                'Stress Reduction',
                'Calmness'
              ],
              description:
                  'Calms the mind and reduces anxiety, helping Players focus and enter a match with a calm and clear mindset',
              onStart: () {
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ohmchantingsteps()));
              }, 
            ),
                  ChoiceCard(
              title: "Daimoku",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Mental Resilience',
                'Perseverance',

                'Confidence'
              ],
              description:
                  'Strengthens mental resolve and determination, helping athletes mentally prepare for challenges and competitions.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>daimokusteps()));
              }, 
            ),
              ChoiceCard(
              title: "Wimhoff Meditation",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Mental Toughness',
                'Focus',

                'Endurance'
              ],
              description:
                  ' Focuses on deep breathing and breath control, improving oxygen capacity and mental resilience.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>wimhoffsteps()));
              }, 
            ),
                    ],
                  ),
                ),
              ),
            ]
          )),
    )
    );
  }
}
