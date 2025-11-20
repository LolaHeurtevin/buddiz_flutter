import 'package:flutter/material.dart';
import 'widgets/main_layout.dart';
import '../models/activity.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity activity;

  const ActivityDetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(activity.description),
                const SizedBox(height: 8),
                Text('Organisateur: ${activity.organizer}'),
              ],
            ),
          ),
        )
    );
  }
}

