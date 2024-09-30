import 'package:firebaseseries/screen/Sportsmedssteps/Yoganidrasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/anulomvilomsteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/balasanasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/kirtankriyasteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/ohmchantingsteps.dart';
import 'package:firebaseseries/screen/Sportsmedssteps/suptaBaddhasteps.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeditationTask extends StatefulWidget {
  const MeditationTask({super.key});

  @override
  _MeditationTaskState createState() => _MeditationTaskState();
}

class _MeditationTaskState extends State<MeditationTask> {
  List<bool> taskCompletion = List.generate(7, (index) => false);
  bool isWeekOne = true;
  bool isWeekTwo = false;
  bool isWeekThree = false;
  bool isWeekFour = false;
  bool isWeekFive = false;
  bool isWeekSix = false;
  bool isWeekSeven = false;

  @override
  void initState() {
    super.initState();
    _loadTaskCompletion();
  }

  Future<void> _loadTaskCompletion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 7; i++) {
      taskCompletion[i] = prefs.getBool('task_$i') ?? false;
    }
    isWeekTwo = prefs.getBool('isWeekTwo') ?? false;
    isWeekThree = prefs.getBool('isWeekThree') ?? false;
    isWeekFour = prefs.getBool('isWeekFour') ?? false;
    isWeekFive = prefs.getBool('isWeekFive') ?? false;
    isWeekSix = prefs.getBool('isWeekSix') ?? false;
    isWeekSeven = prefs.getBool('isWeekSeven') ?? false;
    setState(() {});
  }

  Future<void> _saveTaskCompletion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 7; i++) {
      await prefs.setBool('task_$i', taskCompletion[i]);
    }
    await prefs.setBool('isWeekTwo', isWeekTwo);
    await prefs.setBool('isWeekThree', isWeekThree);
    await prefs.setBool('isWeekFour', isWeekFour);
    await prefs.setBool('isWeekFive', isWeekFive);
    await prefs.setBool('isWeekSix', isWeekSix);
    await prefs.setBool('isWeekSeven', isWeekSeven);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isWeekSeven
            ? "Week 7: Meditation Tasks"
            : isWeekSix
                ? "Week 6: Meditation Tasks"
                : isWeekFive
                    ? "Week 5: Meditation Tasks"
                    : isWeekFour
                        ? "Week 4: Meditation Tasks"
                        : isWeekThree
                            ? "Week 3: Meditation Tasks"
                            : isWeekTwo
                                ? "Week 2: Meditation Tasks"
                                : "Week 1: Meditation Tasks"),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Goal: Build mental toughness, improve focus, and enhance performance through daily meditation and mental exercises.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildDayTile(index),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            width: 300,
                            height: 30,
                            child: Text("Get help from the tutorial"),
                            onPressed: () {
                              navigateToScreen(context, index);
                            }),
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomButton(
                width: 180,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              CustomButton(
                width: 180,
                child: Text(isWeekSeven
                    ? 'Complete Week 7'
                    : isWeekSix
                        ? 'Proceed to Week 7'
                        : isWeekFive
                            ? 'Proceed to Week 6'
                            : isWeekFour
                                ? 'Proceed to Week 5'
                                : isWeekThree
                                    ? 'Proceed to Week 4'
                                    : isWeekTwo
                                        ? 'Proceed to Week 3'
                                        : 'Proceed to Week 2'),
                onPressed: _proceedToNextWeek,
              ),
            ])
          ],
        ),
      ),
    );
  }

  void _proceedToNextWeek() {
    if (!taskCompletion.contains(false)) {
      setState(() {
        if (!isWeekTwo) {
          isWeekTwo = true;
          taskCompletion = List.generate(7, (index) => false);
        } else if (!isWeekThree) {
          isWeekThree = true;
          taskCompletion = List.generate(7, (index) => false);
        } else if (!isWeekFour) {
          isWeekFour = true;
          taskCompletion = List.generate(7, (index) => false);
        } else if (!isWeekFive) {
          isWeekFive = true;
          taskCompletion = List.generate(7, (index) => false);
        } else if (!isWeekSix) {
          isWeekSix = true;
          taskCompletion = List.generate(7, (index) => false);
        } else if (!isWeekSeven) {
          isWeekSeven = true;
          taskCompletion = List.generate(7, (index) => false);
        } else {
          setState(() {
            isWeekOne = true;
            isWeekTwo = false;
            isWeekThree = false;
            isWeekFour = false;
            isWeekFive = false;
            isWeekSix = false;
            isWeekSeven = false;
            taskCompletion = List.generate(7, (index) => false);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'All tasks for Week 7 are completed! Resetting to Week 1.')),
          );
        }
      });
      _saveTaskCompletion();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complete all tasks before proceeding.')),
      );
    }
  }

  @override
  Widget buildDayTile(int index) {
    // Check if all previous tasks are completed
    bool canCompleteTask =
        taskCompletion.sublist(0, index).every((completed) => completed);

    List<String> days = isWeekSeven
        ? [
            "Balanced Calm",
            "Clarity and Peace",
            "Empowered Resolve",
            "Warrior's Mindset",
            "Rejuvenating Rest",
            "Mental Resilience",
            "Mindful Flow"
          ]
        : isWeekSix
            ? [
                "Deep Focus",
                "Total Relaxation",
                "Warrior's Resolve",
                "Vibrational Harmony",
                "Mental Clarity",
                "Resilient Breathing",
                "Inner Strength"
              ]
            : isWeekFive
                ? [
                    "Empowered Warrior",
                    "Inner Calm",
                    "Balanced Mind",
                    "Clarity of Thought",
                    "Restorative Breath",
                    "Strengthened Mind",
                    "Resilient Spirit"
                  ]
                : isWeekFour
                    ? [
                        "Harmonic Balance",
                        "Focused Breathing",
                        "Clarity and Focus",
                        "Deep Relaxation",
                        "Mental Strengthening",
                        "Cold Resilience",
                        "Rejuvenating Rest"
                      ]
                    : isWeekThree
                        ? [
                            "Mental Sharpness",
                            "Open Relaxation",
                            "Determined Mindset",
                            "Resilient Breathing",
                            "Balanced Stretch",
                            "Total Rejuvenation",
                            "Grounded Warrior"
                          ]
                        : isWeekTwo
                            ? [
                                "Mental Fortitude",
                                "Balanced Breath",
                                "Deep Restoration",
                                "Breathing Strength",
                                "Warrior's Resilience",
                                "Vibration of Calm",
                                "Focused Breath"
                              ]
                            : [
                                "Deep Focus",
                                "Total Relaxation",
                                "Warrior's Mindset",
                                "Cold Clarity",
                                "Inner Harmony",
                                "Mental Cleansing",
                                "Restorative Breathing"
                              ];

    List<String> meditations = isWeekSeven
        ? [
            " Warrior Poses Sequence",
            " Yoga Nidra",
            " Daimoku",
            " Kirtan Kriya",
            " Ohm Chanting",
            "Anulom Vilom",
            " Pranayama"
          ]
        : isWeekSix
            ? [
                " Pranayama with Nadi Shodhana",
                " Yoga Nidra",
                " Warrior Poses Sequence",
                " Ohm Chanting",
                " Kirtan Kriya",
                " Wimhoff  Meditation",
                " Daimoku"
              ]
            : isWeekFive
                ? [
                    " Warrior Poses Sequence",
                    " Ohm Chanting",
                    " Anulom Vilom with Seated Forward Bend",
                    " Kirtan Kriya",
                    "Supta Baddha Konasana",
                    "Wimhoff Meditation",
                    "Daimoku"
                  ]
                : isWeekFour
                    ? [
                        " Ohm Chanting",
                        " Pranayama with Nadi Shodhana",
                        " Kirtan Kriya",
                        " Supta Baddha Konasana with Deep Breathing",
                        " Wimhoff Meditation",
                        " Warrior Poses Sequence",
                        " Yoga Nidra"
                      ]
                    : isWeekThree
                        ? [
                            " Kirtan Kriya",
                            " Supta Baddha Konasana with Deep Breathing",
                            " Daimoku",
                            " Wimhoff Meditation",
                            " Anulom Vilom with Seated Forward Bend",
                            " Yoga Nidra",
                            " Warrior Poses Sequence"
                          ]
                        : isWeekTwo
                            ? [
                                " Daimoku",
                                " Anulom Vilom with Seated Forward Bend",
                                " Yoga Nidra",
                                " Wimhoff Meditation",
                                " Warrior Poses Sequence",
                                " Ohm Chanting",
                                " Pranayama with Nadi Shodhana"
                              ]
                            : [
                                " Pranayama with Nadi Shodhana",
                                " Yoga Nidra",
                                " Warrior Poses Sequence",
                                " Wimhoff Meditation",
                                " Ohm Chanting",
                                " Kirtan Kriya",
                                " Supta Baddha Konasana with Deep Breathing"
                              ];

    List<String> tasks = isWeekSeven
        ? [
            "Practice deep breathing exercises to build resilience.",
            "Follow a guided relaxation to recharge.",
            "Engage in rhythmic chanting to enhance focus.",
            "Use deep breathing to reinforce mental strength.",
            "Chant 'Ohm' for 20 minutes to create vibrations of calm.",
            "Focus on deep breathing to enhance clarity.",
            "Perform a sequence of warrior poses to stay grounded."
          ]
        : isWeekSix
            ? [
                "Practice alternate nostril breathing to sharpen focus.",
                "Follow guided relaxation for deep restoration.",
                "Strengthen resolve with a sequence of warrior poses.",
                "Chant 'Ohm' for vibrations that calm the nervous system.",
                "Engage in rhythmic chanting and hand movements.",
                "Focus on breathing to build mental clarity.",
                "Chant for 20 minutes to prepare for challenges."
              ]
            : isWeekFive
                ? [
                    "Engage in a sequence of warrior poses.",
                    "Practice deep breathing for relaxation.",
                    "Use deep breathing to balance mind and body.",
                    "Focus on chanting to enhance mental strength.",
                    "Perform stretches and deep breathing.",
                    "Immerse in guided relaxation for rejuvenation.",
                    "Build mental resilience through challenging poses."
                  ]
                : isWeekFour
                    ? [
                        "Practice deep breathing to promote calmness.",
                        "Use focused breathing with a forward bend.",
                        "Follow guided relaxation to enhance clarity.",
                        "Engage in rhythmic chanting for cleansing.",
                        "Strengthen mental fortitude with cold exposure.",
                        "Focus on restorative poses and breathing.",
                        "Perform warrior poses for strength and resilience."
                      ]
                    : isWeekThree
                        ? [
                            "Engage in rhythmic chanting for clarity.",
                            "Use deep breathing to release stress.",
                            "Chant with determination to reinforce resolve.",
                            "Practice deep breathing for resilience.",
                            "Stretch and breathe to balance.",
                            "Spend time in deep relaxation.",
                            "Perform a sequence of warrior poses."
                          ]
                        : isWeekTwo
                            ? [
                                "Chant for 20 minutes to strengthen resolve.",
                                "Combine alternate nostril breathing with a forward bend.",
                                "Immerse in guided relaxation for restoration.",
                                "Focus on deep breathing exercises.",
                                "Engage in a sequence of warrior poses.",
                                "Chant 'Ohm' for vibrations that calm.",
                                "Practice focused breathing for preparation."
                              ]
                            : [
                                "Practice alternate nostril breathing.",
                                "Follow guided relaxation for restoration.",
                                "Strengthen resolve with warrior poses.",
                                "Practice deep breathing and cold exposure.",
                                "Chant 'Ohm' for 15 minutes.",
                                "Engage in rhythmic chanting for focus.",
                                "Use deep breathing for relaxation."
                              ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Day ${index + 1}: ${days[index]}'),
        Row(children: [
          Checkbox(
            value: taskCompletion[index],
            onChanged: canCompleteTask
                ? (value) {
                    setState(() {
                      taskCompletion[index] = value ?? false;
                      _saveTaskCompletion();
                    });
                  }
                : null, // Disable checkbox if previous tasks are incomplete
          ),
          Center(child: Text('${meditations[index]}\n ${tasks[index]}')),
        ])
      ]),
    );
  }

// Function to show dialog when attempting to check an incomplete task
  void _showTaskIncompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incomplete Tasks'),
          content: const Text(
              'You must complete all previous tasks before proceeding.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void navigateToScreen(BuildContext context, index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ohmchantingsteps()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Yoganidrasteps()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Balasana()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => anulomvilomsteps()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => suptaBaddhasteps()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => kirtankriyasteps()),
        );
    }
  }
}
