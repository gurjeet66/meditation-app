class MeditationSession {
  final String meditation;
  final int timeSpent;
  final DateTime date; // Add a date property

  MeditationSession({
    required this.meditation,
    required this.timeSpent,
    required this.date, // Include date in the constructor
  });

  factory MeditationSession.fromMap(Map<dynamic, dynamic> data) {
    return MeditationSession(
      meditation: data["meditation"] ?? "",
      timeSpent: data["time_spent"] ?? 0,
      date: DateTime.parse(data["date"] ?? DateTime.now().toIso8601String()), // Parse the date
    );
  }
}