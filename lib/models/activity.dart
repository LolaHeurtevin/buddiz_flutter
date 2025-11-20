class Activity {
  final int id;
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  final int organizer;

  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.organizer,
  });

  // retourne un objet Dart à partir d'un fichier json
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      organizer: json['organizer'],
    );
  }

  // retourne un objet Dart en json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'organizer': organizer,
    };
  }
}
