import 'package:firebaseseries/screen/Homescreen.dart';

import 'package:firebaseseries/screen/one.dart';
import 'package:firebaseseries/screen/quickmeditation2.dart';
import 'package:firebaseseries/screen/quickmeditation4.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/sessionbox3.dart';
import 'package:flutter/material.dart';

class Quickmeditation extends StatefulWidget {
  const Quickmeditation({super.key});

  @override
  State<Quickmeditation> createState() => _QuickmeditationState();
}

class _QuickmeditationState extends State<Quickmeditation> {
  bool _voiceGuidanceEnabled = false;

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SessionBoxScreen3(
                titletext: "High Performance",
                subtitletext: "Meditation",
                lowertext: "Meditation: 15-20 minutes",
                onTap: () {},
                Image1: "assets/Depth 4, Frame 1.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Visualization Meditation with\nSurya Bhedana (Right Nostril\nBreathing)",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w700, color: color2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
                "This meditation combines powerful\nvisualization techniques with Surya Bhedana \npranayama to energize the body, sharpen\nfocus, and enhance mental clarity.\nVisualization helps athletes mentally rehearse \ntheir performance, creating a mental\nblueprint for success, while Surya Bhedana\nincreases alertness and energy levels.",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400, color: color2)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Text(
                  " Enable Voice Guidance",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: color2),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Switch(
                    value: _voiceGuidanceEnabled,
                    onChanged: (value) {
                      setState(() {
                        _voiceGuidanceEnabled = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: CustomButton(
                height: 50,
                width: 350,
                child: const Text("Start"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const quickmeditation4()));
                }),
          ),
        ],
      ),
    );
  }
}
