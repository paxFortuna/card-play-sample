import 'package:card_play/domain/model/user.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// User 모델 클래스와 loadUsers 메소드는 위에서 제공된 코드를 그대로 사용합니다.
// 편의를 위해 이 파일에 포함하거나, 별도의 파일(예: models/user.dart)에 분리하여 import 할 수 있습니다.
class UserApi {
  Future<List<User>> loadUsers() async {
    final String response = await rootBundle.loadString('assets/user.json');
    final List<dynamic> rawData = jsonDecode(response);
    // final List<Map<String, dynamic>> data = jsonDecode(response);
    final List<Map<String, dynamic>> data = rawData
        .cast<Map<String, dynamic>>();

    return data.map((json) => User.fromJson(json)).toList();
  }
}
