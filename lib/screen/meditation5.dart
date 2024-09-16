import 'package:firebaseseries/screen/widgets/Choicecard.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
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
                height: myheight / 7,
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
                          Container(
                            height: 60,
                            width: 200,
                            child: Text(
                              'Recomended for relaxation',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 200,
                            child: Text(
                              'meditation . 30 min',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(
                                    "assets/Depth 4, Frame 1.png"))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ChoiceCard(
              title: "Pranayam (Breath control)",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Enhanced Focus',
                'Stress Reduction',
                'Improved Breathing Efficiency'
              ],
              description:
                  'Calms the mind and reduces anxiety, helping Players focus and enter a match with a calm and clear mindset',
              onStart: () {},
            ),
            ChoiceCard(
              title: "Pranayam (Breath control)",
              subtitle: 'Pre-Match Deepression',
              tags: [
                'Enhanced Focus',
                'Stress Reduction',
                'Improved Breathing Efficiency'
              ],
              description:
                  'Calms the mind and reduces anxiety, helping Players focus and enter a match with a calm and clear mindset',
              onStart: () {},
            )
          ],
        ),
      ),
    );
  }
}
