import 'package:buddiz/views/widgets/activity_card_widget.dart';
import 'package:flutter/material.dart';
import 'main_layout.dart';
import '../models/activity.dart';

class ActivitiesListPage extends StatefulWidget {
  static const route = '/activities-list';
  const ActivitiesListPage({super.key});

  @override
  State<ActivitiesListPage> createState() => _ActivitiesListPage();
}

class _ActivitiesListPage extends State<ActivitiesListPage> {
  final List<Activity> activities = [
    Activity(
      id: 1,
      title: 'Pique nique',
      description: 'Pique nique au parc',
      latitude: 47.21725,
      longitude: -1.55336,
      organizer: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return ActivityCardWidget(activity: activities[index]);
          },
        ),
    );
  }
}