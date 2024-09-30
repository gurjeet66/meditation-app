import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/model/meditationSession.dart';
import 'package:firebaseseries/screen/chartscreen.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int totalMeditationTime = 0;
  int totalMeditationDays = 0;
  int currentStreakDays = 0;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<MeditationSession> _sessions = [];

  // New variables for goal input and status
  final TextEditingController _goalController = TextEditingController();
  String goalStatus = ""; // To track if the goal is completed or not

  @override
  void initState() {
    super.initState();
    _fetchTotalTimeAndDays();
  }
Future<void> _fetchTotalTimeAndDays() async {
  DatabaseReference _dbRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child("userId")
      .child("meditation_session");
  
  _dbRef.once().then((DatabaseEvent snapshot) {
    Map<dynamic, dynamic> data = snapshot.snapshot.value as Map<dynamic, dynamic>;

    setState(() {
      _sessions = data.entries.map((entry) {
        return MeditationSession.fromMap(entry.value);
      }).toList();

      // Calculate total time and days
      totalMeditationTime = _sessions.fold(0, (sum, session) => sum + session.timeSpent);
      totalMeditationDays = _sessions.length;

      // Calculate current streak
      if (_sessions.isNotEmpty) {
        _sessions.sort((a, b) => a.date.compareTo(b.date)); // Sort by date
        DateTime lastDate = _sessions.last.date; // Most recent session
        currentStreakDays = 1; // Start with 1 for the last day

        for (int i = _sessions.length - 2; i >= 0; i--) {
          DateTime currentDate = _sessions[i].date;
          if (lastDate.difference(currentDate).inDays == 1) {
            currentStreakDays++;
            lastDate = currentDate;
          } else {
            break; // Streak is broken
          }
        }
      } else {
        currentStreakDays = 0; // No sessions means no streak
      }
    });
  });
}


  void _saveGoal() {
    final int enteredGoal = int.tryParse(_goalController.text) ?? 0;

    // Check if goal is entered
    if (enteredGoal > 0) {
      setState(() {
        goalStatus = totalMeditationTime >= enteredGoal ? "Completed Goal" : "Incomplete Goal";
      });

      _showGoalStatusDialog(); // Show the dialog after saving the goal
    } else {
      _showSnackbar("Please enter a valid goal!"); // Show Snackbar for invalid input
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showGoalStatusDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Goal Status"),
          content: Text(goalStatus.isEmpty ? "No Goal Set" : goalStatus),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text(
            'Progress',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
          ),
          leading: IconButton(
            icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: color2, borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.arrow_back,
                  color: color1,
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _sessions.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Meditation Stats',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      _buildStatContainer(
                        myheight: 62,
                        mywidth: 193,
                        title: 'Total Time Spent:',
                        value: '${totalMeditationTime} sec',
                        titlePadding: const EdgeInsets.only(right: 30, top: 5),
                        valuePadding: const EdgeInsets.only(right: 60),
                      ),
                      const SizedBox(height: 12),
                      _buildStatContainer(
                        myheight: 62,
                        mywidth: 249,
                        title: 'Sessions Completed:',
                        value: '${_sessions.length}',
                        titlePadding: const EdgeInsets.only(right: 60, top: 5),
                        valuePadding: const EdgeInsets.only(right: 185),
                      ),
                      const SizedBox(height: 12),
                      _buildStatContainer(
                        myheight: 62,
                        mywidth: 307,
                        title: 'Current Streak:',
                        value: '$currentStreakDays days',
                        titlePadding: const EdgeInsets.only(right: 160, top: 5),
                        valuePadding: const EdgeInsets.only(right: 180),
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                        _buildWeeklyProgressTile(),
                      // ListTile(
                      //   title: const Text('Weekly Progress'),
                      //   trailing: const Icon(Icons.keyboard_arrow_right),
                      //   onTap: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChartScreen()));
                      //   },
                      // ),
                      const Divider(),
                      const SizedBox(height: 24),
                      const Text(
                        'Set Your Goals',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      _buildGoalInputField(),
                      const SizedBox(height: 12),
                      CustomButton(
                        height: 50,
                        width: 358,
                        child: const Text(
                          "Save Goal",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        onPressed: _saveGoal, // Update to call _saveGoal
                      ),
                      const SizedBox(height: 12),
                      // Display the goal status in a TextButton
                      TextButton(
                        onPressed: _showGoalStatusDialog, // Show dialog on press
                        child: Text(
                          goalStatus.isEmpty ? "No Goal Set" : goalStatus,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: goalStatus == "Completed Goal" ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildStatContainer({
    required String title,
    required String value,
    required double mywidth,
    required double myheight,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(),
    EdgeInsetsGeometry titlePadding = const EdgeInsets.only(),
    EdgeInsetsGeometry valuePadding = const EdgeInsets.only(),
  }) {
    return Container(
      width: mywidth,
      height: myheight,
      decoration: const BoxDecoration(
        color: Color(0xff2C3E50),
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(30), bottomEnd: Radius.circular(30)),
      ),
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w500, color: color1),
            ),
          ),
          Padding(
            padding: valuePadding,
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: color1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalInputField() {
    return TextField(
      controller: _goalController, // Attach the controller
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: 'Set Long-term Goal (in seconds)',
      ),
      keyboardType: TextInputType.number,
    );
  }
  Widget _buildWeeklyProgressTile() {
  // Example data for weekly progress
  int sessionsThisWeek = 3; // Replace with actual data
  int totalTimeThisWeek = 1800; // Total time in seconds for the week

  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: Icon(
        Icons.show_chart,
        size: 40,
        color: color1,
      ),
      title: Text(
        'Weekly Progress',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${_sessions.length} sessions this week\n Total time: ${totalMeditationTime} sec',
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        // Navigate to the ChartScreen or other screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChartScreen(),
          ),
        );
      },
    ),
  );
}
}