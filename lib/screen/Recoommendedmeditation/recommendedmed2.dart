import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:flutter/material.dart';

class recommendedmed2 extends StatefulWidget {
  const recommendedmed2({super.key});

  @override
  State<recommendedmed2> createState() => _recommendedmed2State();
}

class _recommendedmed2State extends State<recommendedmed2> {
  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        title: Text(
          "Meditation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: myheight / 7.2,
                width: mywidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 60,
                              width: 200,
                              child: Text(
                                'Recomended for Mental Preparation',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Container(
                              height: 22,
                              width: 160,
                              child: Text(
                                'meditation . 30 min',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 150,
                        width: 120,
                        child: Image.asset(
                          "assets/Depth 4, Frame 1.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ChoiceCard(
              title: "Warrior Poses Sequence (Virabhadrasana I, II, III): ",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Physical and mental resilience',
                'focus',
              ],
              description:
                  'Builds physical and mental resilience, helping athletes prepare mentally for competition by fostering strength and focus.',
              onStart: () {},
            ),
            ChoiceCard(
              title:
                  "Kirtan Kriya: ",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'mental clarity',
                ' focus',
              ],
              description:
                  'Enhances mental clarity and focus, making it an excellent choice for preparing the mind for high-pressure sports situations.',
              onStart: () {},
            ),
            ChoiceCard(
              title: "Daimoku:",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Mental Resilience',
                'Perseverance',

                'Confidence'
              ],
              description:
                  'Strengthens mental resolve and determination, helping athletes mentally prepare for challenges and competitions.',
              onStart: () {},
            ),
          ],
        ),
      ),
    );
  }
}
