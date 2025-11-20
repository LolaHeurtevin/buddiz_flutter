import 'package:buddiz/views/widgets/activity_card_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/main_layout.dart';
import '../models/activity.dart';
import '../controllers/activities_controller.dart';

class ActivitiesListPage extends StatefulWidget {
  static const route = '/activities-list';
  const ActivitiesListPage({super.key});

  @override
  State<ActivitiesListPage> createState() => _ActivitiesListPage();
}

class _ActivitiesListPage extends State<ActivitiesListPage> {
  // la variable futureactivities sera initialisée plus tard
  late Future<List<Activity>> futureActivities;
  late ActivitiesController controller;

  @override
  void initState() { // fonction appelée au moment où le widget est inséré dans le widget tree (une seule fois)
    super.initState();
    controller = ActivitiesController();
    futureActivities = controller.getActivities();
  }


  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: FutureBuilder<List<Activity>>(
        future: futureActivities,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          }

          final activities = snapshot.data ?? [];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Toutes les activités",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),

                ...activities.map((activity) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ActivityCardWidget(activity: activity),
                )),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}