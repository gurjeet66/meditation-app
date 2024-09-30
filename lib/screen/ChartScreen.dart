import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/model/meditationSession.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<MeditationSession> _sessions = [];
  Map<String, int> meditationData = {}; // Store meditation types and their total time spent

  @override
  void initState() {
    super.initState();
    _fetchMeditationData();
  }

  Future<void> _fetchMeditationData() async {
    DatabaseReference _dbRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child("userId")
        .child("meditation_session");
    _dbRef.once().then((DatabaseEvent snapshot) {
      Map<dynamic, dynamic> data =
          snapshot.snapshot.value as Map<dynamic, dynamic>;

      setState(() {
        _sessions = data.entries.map((entry) {
          return MeditationSession.fromMap(entry.value);
        }).toList();

        // Aggregate data based on meditation types
        meditationData.clear();
        for (var session in _sessions) {
          if (meditationData.containsKey(session.meditation)) {
            meditationData[session.meditation] =
                meditationData[session.meditation]! + session.timeSpent;
          } else {
            meditationData[session.meditation] = session.timeSpent;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation Chart'),
      ),
      body: _sessions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 38,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < meditationData.keys.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                meditationData.keys.elementAt(index),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  barGroups: _getBarGroups(),
                  gridData: FlGridData(show: true),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${meditationData.keys.elementAt(group.x)}\n',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${rod.toY}',
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    List<BarChartGroupData> barGroups = [];
    int index = 0;

    meditationData.forEach((type, timeSpent) {
      barGroups.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: timeSpent.toDouble(),
              gradient: _getGradientForIndex(index), // Use gradient instead of color
              width: 30,
            ),
          ],
        ),
      );
      index++;
    });

    return barGroups;
  }

  Gradient _getGradientForIndex(int index) {
    const gradients = [
      LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
      LinearGradient(colors: [Colors.green, Colors.lightGreen]),
      LinearGradient(colors: [Colors.orange, Colors.amber]),
      LinearGradient(colors: [Colors.red, Colors.redAccent]),
      LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
      LinearGradient(colors: [Colors.teal, Colors.tealAccent]),
      LinearGradient(colors: [Colors.yellow, Colors.yellowAccent]),
    ];
    return gradients[index % gradients.length]; // Return the gradient directly
  }
}