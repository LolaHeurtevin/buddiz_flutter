import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'main_layout.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = [
      Marker(
        point: LatLng(48.8566, 2.3522),
        width: 40,
        height: 40,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
      Marker(
        point: LatLng(48.8606, 2.3376),
        width: 40,
        height: 40,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    ];

    return MainLayout(
      child: Scaffold(
        body: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(48.8566, 2.3522),
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
            )
          ],
        ),
      )
    );
  }
}
