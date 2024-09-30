import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/thirdweekscreen.dart';
import 'package:flutter/material.dart';

class NextWeekScreen extends StatefulWidget {
  const NextWeekScreen({super.key});

  @override
  _NextWeekScreenState createState() => _NextWeekScreenState();
}

class _NextWeekScreenState extends State<NextWeekScreen> {
  List<bool> taskCompletion = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Duration: Next Week"),
        backgroundColor: Colors.white,
        leading: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color6,
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: color1,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Goal: Strengthen mental toughness and enhance performance through daily meditation and mental exercises.',
              style: TextStyle(fontSize: 16, color: color7),
            ),
            const SizedBox(height: 16),
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
                    minimumSize: const Size(170, 34),
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Cancel button
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(170, 34),
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: () {
                    // Check if all tasks are completed before navigating
                    if (taskCompletion.every((completed) => completed)) {
                      // Navigate to the next screen if all tasks are complete
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Thirdweekscreen()), // Replace with your next screen
                      );
                    } else {
                      // Show a message if not all tasks are completed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Complete all tasks before proceeding!')),
                      );
                    }
                  },
                  child: const Text('Complete'),
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
      "Day 1: Mental Fortitude",
      "Day 2: Balanced Breath",
      "Day 3: Deep Restoration",
      "Day 4: Breathing Strength",
      "Day 5: Warrior's Resilience",
      "Day 6: Vibration of Calm",
      "Day 7: Focused Breath"
    ];

    List<String> meditations = [
      "Meditation: Daimoku",
      "Meditation: Anulom Vilom with Seated Forward Bend",
      "Meditation: Yoga Nidra",
      "Meditation: Wimhoff Meditation",
      "Meditation: Warrior Poses Sequence",
      "Meditation: Ohm Chanting",
      "Meditation: Pranayama with Nadi Shodhana"
    ];

    List<String> tasks = [
      "Task: Chant for 20 minutes to strengthen your mental resolve and prepare for challenges.",
      "Task: Combine alternate nostril breathing with a forward bend to enhance breath control and flexibility.",
      "Task: Immerse yourself in a 25-minute guided relaxation for deep mental and physical restoration.",
      "Task: Focus on deep breathing exercises to increase your lung capacity and mental endurance.",
      "Task: Engage in a sequence of warrior poses to build resilience and strength for your sport.",
      "Task: Chant 'Ohm' for 20 minutes to create vibrations that calm the nervous system.",
      "Task: Practice deep, focused breathing to prepare your mind for the challenges of the week ahead."
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
              days[index],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(259, 38),
                  backgroundColor: color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Get help from tutorial",
                  style: TextStyle(color: color1, fontSize: 17),
                ),
              ),
              const SizedBox(height: 16),
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
        const Text(
          "• ",
          style: TextStyle(fontSize: 18, color: color9),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
