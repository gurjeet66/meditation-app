import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:flutter/material.dart';

class recommendedmed3 extends StatefulWidget {
  const recommendedmed3({super.key});

  @override
  State<recommendedmed3> createState() => _recommendedmed3State();
}

class _recommendedmed3State extends State<recommendedmed3> {
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
                                'Recomended for Mindful Breathing',
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
              title: "Pranayama with Nadi Shodhana (Alternate Nostril Breathing):",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Enhances breathing',
                'focus',
              ],
              description:
                  'Enhances breathing efficiency and focus, crucial for maintaining composure and endurance.',
              onStart: () {},
            ),
            ChoiceCard(
              title:
                  "Wimhoff Meditation:  ",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Mental Toughness',
                'Focus',

                'Endurance'
              ],
              description:
                  ' Focuses on deep breathing and breath control, improving oxygen capacity and mental resilience..',
              onStart: () {},
            ),
            ChoiceCard(
              title: "Anulom Vilom (Alternate Nostril Breathing) with Seated Forward Bend (Paschimottanasana):",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'promoting calmness ',
                'Focus',
              ],
              description:
                  ' Combines mindful breathing with physical stretching, promoting calmness and focus.',
              onStart: () {},
            ),
          ],
        ),
      ),
    );
  }
}
