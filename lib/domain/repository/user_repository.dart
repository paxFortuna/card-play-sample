import 'package:card_play/domain/model/user.dart';

abstract class UserApiRepository {
  Future<List<User>> fetch();
}