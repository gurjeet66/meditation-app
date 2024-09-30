import 'dart:convert';

class MeditationList {
  final String success;
  final String message;
  final List<MeditationDetail> details;

  MeditationList({required this.success, required this.message, required this.details});

  factory MeditationList.fromJson(Map<String, dynamic> json) {
    var list = json['details'] as List;
    List<MeditationDetail> detailsList = list.map((i) => MeditationDetail.fromJson(i)).toList();

    return MeditationList(
      success: json['success'],
      message: json['message'],
      details: detailsList,
    );
  }
}

class MeditationDetail {
  final String id;
  final String name;
  final List<String> steps;

  MeditationDetail({required this.id, required this.name, required this.steps});

  factory MeditationDetail.fromJson(Map<String, dynamic> json) {
    var list = json['steps'] as List;
    List<String> stepsList = list.map((i) => i as String).toList();

    return MeditationDetail(
      id: json['id'],
      name: json['name'],
      steps: stepsList,
    );
  }
}
