import 'package:buddiz/views/widgets/activity_card_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/main_layout.dart';
import '../models/activity.dart';
import '../services/activity_service.dart';

class ActivitiesListPage extends StatefulWidget {
  static const route = '/activities-list';
  const ActivitiesListPage({super.key});

  @override
  State<ActivitiesListPage> createState() => _ActivitiesListPage();
}

class _ActivitiesListPage extends State<ActivitiesListPage> {
  // la variable futureactivities sera initialisée plus tard
  late Future<List<Activity>> futureActivities;

  @override
  void initState() { // fonction appelée au moment où le widget est inséré dans le widget tree (une seule fois)
    super.initState();
    futureActivities = ActivityService().loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: FutureBuilder<List<Activity>>(
        future: futureActivities,
        builder: (context, snapshot) {
          //Gestion chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Gestion erreurs
          if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          }

          // Données chargées
          final activities = snapshot.data ?? [];

          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return ActivityCardWidget(activity: activities[index]);
            },
          );
        },
      ),
    );
  }
}