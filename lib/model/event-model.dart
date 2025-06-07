// ignore_for_file: file_names

class EventModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  EventModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // JSON se Dart object
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Dart object se JSON (agar kabhi post karna ho)
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
