class Batch {
  late int userId;
  late int id;
  late String title;

  Batch({required this.userId, required this.id, required this.title});

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
  Batch.fromMap(Map<String, dynamic> d) {
    userId = d["userId"];
    id = d["id"];
    title = d["title"].toString();
  }
}
