import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import '../models/activity.dart';
import '../services/activity_service.dart';
import 'widgets/main_layout.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Activity>> futureActivities;

  @override
  void initState() {
    super.initState();
    // Controller : récupérer les données via le service (Model)
    futureActivities = ActivityService().loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showAppBar: false,
      child: FutureBuilder<List<Activity>>(
        future: futureActivities,
        builder: (context, snapshot) {
          // Gestion du chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Gestion des erreurs
          if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          }

          // Données chargées
          final activities = snapshot.data ?? [];

          // Transformation des activités en markers
          final markers = activities.map((activity) {
            return Marker(
              point: LatLng(activity.latitude, activity.longitude),
              width: 40,
              height: 40,
              child: const Icon(Icons.location_on, color: Color(0xFF490715), size: 40),
            );
          }).toList();

          // Affichage de la carte avec les markers
          return Scaffold(
            body: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(47.216671, -1.55),
                initialZoom: 12,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: "com.example.buddiz",
                ),
                MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                    maxClusterRadius: 45,
                    size: const Size(50, 50),
                    markers: markers,
                    builder: (context, clusteredMarkers) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            clusteredMarkers.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
