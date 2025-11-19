class Activity {
  final String id;
  final String title;
  final String description;
  final String latitude;
  final String longitude;
  final String organizer;

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
