import 'package:firebaseseries/screen/Sportsmedssteps/Yoganidrasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/daimokusteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/kirtankriyasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/suptaBaddhasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/warriorposesteps.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/customexercise.dart';
import 'package:flutter/material.dart';

class basketballmeditation extends StatefulWidget {
  const basketballmeditation({super.key});

  @override
  State<basketballmeditation> createState() => _basketballmeditationState();
}

class _basketballmeditationState extends State<basketballmeditation> {
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
                                "Soccer",
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
                                    "assets/designers_28349_A_realistic_image_of_a_soccer_player_in_mid-a_3e08542e-776d-451a-a633-6d64d78df3c5_0.png"),
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
                  height: 3100,
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
                'Physical And Mental Prepration',
                'Resilience',
              
                
              ],
              description:
                  'Strengthens legs, improves balance, enhances flexibility, opens hips, builds stamina, and boosts focus and confidence, providing a full-body workout and mental clarity.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>warriorposestep()));
              }, 
            ),
            ChoiceCard(
              title: "Yoga Nidra",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                
                'Relaxation',
                'Recovery',
                'Mental-Clarity'
              ],
              description:
                  'It helps reduce stress, enhance sleep quality, improve focus, and promote overall well-being by bringing the practitioner into a state between wakefulness and sleep. Yoga Nidra is effective for restoring energy, calming the nervous system, and cultivating mindfulness',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Yoganidrasteps()));
              }, 
            ),
                  
                      const SizedBox(
                        height: 10,
                      ),
                      ChoiceCard(
              title: "Supta Baddha Konasana With Deep Breathing",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Muscle Recovery',
                'Mental Relaxation',
          
              ],
              description:
                  'This pose helps open the hips and chest, relaxes the body, calms the mind, reduces stress, and enhances lung capacity through controlled, deep breathing. It promotes relaxation, improves circulation, and is particularly beneficial for alleviating tension in the lower back and hips.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>suptaBaddhasteps()));
              }, 
            ),
                  ChoiceCard(
              title: "Kirtan Kriya",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Mental Sharpness',
                'Cognitive Function',

                'Teamwork'
              ],
              description:
                  'Enhances mental clarity and focus, making it an excellent choice for preparing the mind for high-pressure sports situations.',
              onStart: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>kirtankriyasteps()));
              }, 
            ),
              ChoiceCard(
              title: "Daimoku",
              subtitle: 'Pre-Match Deepression',
              tags: const [
                'Mental Toughness',
                'Perseverance',
                'Team Morale'
              ],
              description:
                  'Calms the mind and reduces anxiety, helping Players focus and enter a match with a calm and clear mindset',
              onStart: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>daimokusteps()));
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
