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

  @override
  String toString() {
    return 'Post(id: $id, title: $title, description: $description, organizer: $organizer)';
  }
}
