class Sandy {
  late int userId;
  late int id;
  late String title;

  Sandy({required this.userId, required this.id, required this.title});

  factory Sandy.fromJson(Map<String, dynamic> json) {
    return Sandy(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
  Sandy.fromMap(Map<String, dynamic> d) {
    userId = d["userId"];
    id = d["id"];
    title = d["title"].toString();
  }
}
