import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:firebaseseries/screen/widgets/customexercise.dart';
import 'package:flutter/material.dart';

class Meditation1 extends StatefulWidget {
  @override
  _Meditation1State createState() => _Meditation1State();
}

class _Meditation1State extends State<Meditation1> {
  // State variables for switches
  bool _voiceGuidanceEnabled = false;
  bool _backgroundSoundEnabled = false;
  bool _hapticFeedbackEnabled = false;

  @override
  Widget build(BuildContext context) {
    var myheight = MediaQuery.of(context).size.height;
    var mywidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
        child: Column(
          children: [
            Container(
              height: 140,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color6,
              ),
              child: Stack(clipBehavior: Clip.none, children: [
                const Positioned(
                  top: 15,
                  left: 15,
                  child: Text(
                    "Meditation for",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Positioned(
                  top: 30,
                  left: 15,
                  child: Text(
                    "Tennis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 60,
                  left: 15,
                  child: Text(
                    "Players",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 250,
                  bottom: 40,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: ExactAssetImage("assets/Vector.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  child: Container(
                    width: 150,
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                            "assets/designers_28349_A_realistic_image_of_a_tennis_player_in_mid-a_c961ce2a-f214-4ef2-9dde-569cb76d38aa_1 1.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: myheight / 1.2,
                width: mywidth / 1.05,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 15, 0, 0),
                      child: pranayam,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Pre_Match,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: benefits(name: "Enhanced Focus"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: benefits(name: "Stress Reduction"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              benefits(name: "Improved Breathing Efficiency"),
                        ),
                        SizedBox(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: description,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Adjust Volume",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("Voice Guidance")),
                          Switch(
                            value: _voiceGuidanceEnabled,
                            onChanged: (value) {
                              setState(() {
                                _voiceGuidanceEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("Background Sound")),
                          Switch(
                            value: _backgroundSoundEnabled,
                            onChanged: (value) {
                              setState(() {
                                _backgroundSoundEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("Haptic Feedback")),
                          Switch(
                            value: _hapticFeedbackEnabled,
                            onChanged: (value) {
                              setState(() {
                                _hapticFeedbackEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 40,
                        width: 310,
                        decoration: BoxDecoration(
                            color: Color(0xffA09CAB),
                            border: Border.all(color: color2),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Set custom timer (minutes)"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                          height: 40,
                          width: 342,
                          child: Text("Start"),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
