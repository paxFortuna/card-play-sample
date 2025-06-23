import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// User 모델 클래스와 loadUsers 메소드는 위에서 제공된 코드를 그대로 사용합니다.
// 편의를 위해 이 파일에 포함하거나, 별도의 파일(예: models/user.dart)에 분리하여 import 할 수 있습니다.

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


Future<List<User>> loadUsers() async {
  final String response = await rootBundle.loadString('assets/user.json');
  final List<dynamic> rawData = jsonDecode(response);
  // final List<Map<String, dynamic>> data = jsonDecode(response);
  final List<Map<String, dynamic>> data = rawData.cast<Map<String, dynamic>>();

  return data.map((json) => User.fromJson(json)).toList();
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // 데이터를 비동기적으로 로드할 Future 객체
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    // initState에서 데이터 로드 시작
    _usersFuture = loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<User>>(
        // future: loadUsers(),
        future: _usersFuture, // loadUsers() 메소드가 반환하는 Future
        builder: (context, snapshot) {
          // 데이터 로딩 중일 때
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // 에러 발생 시
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // 데이터가 없을 때
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          }
          // 데이터 로드 성공 시
          else {
            final List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user.id), // ID를 아바타에 표시
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.title),
                  onTap: () {
                    // ListTile 탭 시 동작 (예: 상세 화면으로 이동)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Tapped on ${user.name} (${user.id})')),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}