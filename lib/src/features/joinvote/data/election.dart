class Election {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> allowedUsers;
  final List<String> candidates;

  Election({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.allowedUsers,
    required this.candidates,
  });
}
