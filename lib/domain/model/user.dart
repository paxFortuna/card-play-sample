class User {
  final String id;
  final String name;
  final String title;

  User({required this.id, required this.name, required this.title});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
    );
  }
}