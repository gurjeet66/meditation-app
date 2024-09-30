import 'package:firebaseseries/screen/Sportsmedssteps/warriorposesteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/kirtankriyasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/Yoganidrasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/ohmchantingsteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/pranayamsteps.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/customexercise.dart';
import 'package:flutter/material.dart';

class tennismeditation extends StatefulWidget {
  const tennismeditation({super.key});

  @override
  State<tennismeditation> createState() => _tennismeditationState();
}

class _tennismeditationState extends State<tennismeditation> {
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
                                "Tennis",
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
                                    "assets/designers_28349_A_realistic_image_of_a_tennis_player_in_mid-a_c961ce2a-f214-4ef2-9dde-569cb76d38aa_1 1.png"),
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
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    "assets/Vector.png"),
                              ),
                            ),
                          ),
                        ),
                      ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 3000,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChoiceCard(
                      
              title: "Warrior Poses Sequence",
              subtitle: "Pre-Match Deepression",
              tags: const [
                'Physical and Mental resilience',
                'Strength',
                
              ],
              description:
                  'Strengthens legs, improves balance, enhances flexibility, opens hips, builds stamina, and boosts focus and confidence, providing a full-body workout and mental clarity.',
              onStart: () {  Navigator.push(context, MaterialPageRoute(builder: (context)=>warriorposestep()));},
            ),
            ChoiceCard(
              
              title: "Kirtan Kriya",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                
                '  Mental Sharpness',
                'Decision-making',
                'Focus'
              ],
              description:
                  'Enhances mental clarity and focus, making it an excellent choice for preparing the mind for high-pressure sports situations.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>kirtankriyasteps()));
              },
            ),
                  
                      const SizedBox(
                        height: 10,
                      ),
                      ChoiceCard(
                    
              title: "Yoga Nidra",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Recovery',
                'Relaxation',
                'Mental Clarity'
              ],
              description:
                  'It helps reduce stress, enhance sleep quality, improve focus, and promote overall well-being by bringing the practitioner into a state between wakefulness and sleep. Yoga Nidra is effective for restoring energy, calming the nervous system, and cultivating mindfulness',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Yoganidrasteps()));
              },
            ),
                  ChoiceCard(
                  
              title: "Ohm Chanting",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Balance',
                'Stress relief',

                'Calmness'
              ],
              description:
                  'Calms the mind and reduces anxiety, helping Players focus and enter a match with a calm and clear mindset',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ohmchantingsteps()));
              },
            ),
              ChoiceCard(
               
              title: "Pranayama with Nadi Shodhana",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Breath-Control',
                'Focus',

                'Composure'
              ],
              description:
                  'By alternating between nostrils, it helps improve lung function, promote relaxation, clear blocked energy pathways (nadis), and restore harmony between the left and right hemispheres of the brain, leading to a balanced and centered state of mind.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>pranayamsteps()));
              },
            ),
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
