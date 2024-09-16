import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class meditationtask extends StatefulWidget {
  @override
  _meditationtaskState createState() => _meditationtaskState();
}

class _meditationtaskState extends State<meditationtask> {
  List<bool> taskCompletion = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Duration: 7-Day "),
        backgroundColor: Colors.white,
        leading: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: color6, borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: color1,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Goal: Build mental toughness, improve focus, and enhance performance through daily meditation and mental exercises.',
              style: TextStyle(fontSize: 16, color: color7),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return buildDayTile(index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(170, 34),
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(170, 34),
                    backgroundColor: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: () {
                    // Complete action
                  },
                  child: Text('Complete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDayTile(int index) {
    List<String> days = [
      "Calm Before the Storm",
      "Bounce Back from Defeat",
      "Surge of Energy",
      "Sharpen Your Focus",
      "Building Resilience",
      "Mindful Recovery",
      "Mental Edge"
    ];

    List<String> meditations = [
      "Meditation: Visualization Meditation",
      "Meditation: Kirtan Kriya for Emotional Balance",
      "Meditation: Wimhoff Breathing Technique",
      "Meditation: Trataka (Candle Gazing) for Enhanced Focus",
      "Meditation: Daimoku Chanting for Mental Strength",
      "Meditation: Yoga Nidra for Deep Relaxation",
      "Meditation: Anulom Vilom for Stress Relief"
    ];

    List<String> tasks = [
      "Task: Visualize your upcoming match or event with precision and confidence.",
      "Task: Use Kirtan Kriya to process emotions and regain composure after a loss.",
      "Task: Practice Wimhoff breathing to energize your body and mind before training.",
      "Task: Use Trataka to improve concentration during critical moments in a game.",
      "Task: Engage in Daimoku chanting to build inner strength and resilience.",
      "Task: Use Yoga Nidra to fully relax and recover, both mentally and physically.",
      "Task: Practice Anulom Vilom to stay calm and collected under pressure."
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: taskCompletion[index],
              onChanged: (bool? value) {
                setState(() {
                  taskCompletion[index] = value!;
                });
              },
            ),
            Text(
              "Day ${index + 1}: ${days[index]}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDotWithText(meditations[index]),
              buildDotWithText(tasks[index]),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(259, 38),
                  backgroundColor: color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Get help from tutorial",
                  style: TextStyle(color: color1, fontSize: 17),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDotWithText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(fontSize: 18, color: color9),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
