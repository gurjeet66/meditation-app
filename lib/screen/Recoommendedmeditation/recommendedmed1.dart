import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:flutter/material.dart';

class recommendedmed1 extends StatefulWidget {
  const recommendedmed1({super.key});

  @override
  State<recommendedmed1> createState() => _recommendedmed1State();
}

class _recommendedmed1State extends State<recommendedmed1> {
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
                                'Recomended for relaxation',
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
              title: "Yoga Nidra",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Relaxation',
                'Release Tension',
              ],
              description:
                  'This meditation is highly effective for deep relaxation and recovery,helping athletes to release tension and mental fatigue',
              onStart: () {},
            ),
            ChoiceCard(
              title:
                  "Supta Baddha Konasana (Reclining Bound Angle Pose) with Deep Breathing: ",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Deep relaxation',
                'enhances breathing',
              ],
              description:
                  'Promotes deep relaxation, especially in the lower body, and enhances breathing for better recovery.',
              onStart: () {},
            ),
            ChoiceCard(
              title: "Ohm Chanting",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Relaxation',
                'Stress relief.',
              ],
              description:
                  'Calms the mind and promotes emotional stability, making it ideal for relaxation and stress relief.',
              onStart: () {},
            ),
          ],
        ),
      ),
    );
  }
}
