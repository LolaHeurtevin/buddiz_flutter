import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/activity.dart';

class ActivityService {
  Future<List<Activity>> loadActivities() async {
    final String jsonString =
    await rootBundle.loadString('assets/data/activities.json');

    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((item) => Activity.fromJson(item)).toList();
  }
}
