import 'package:card_play/domain/model/user.dart';
import 'package:card_play/domain/repository/user_api_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserApiRepository userApiRepository;

  UserController(this.userApiRepository);
  final RxList<User> _users = <User>[].obs;

  List<User> get users => _users;

  Future<List<User>> fetch() async {
    final result = await userApiRepository.fetch();
   _users.value = result;
  return _users.toList(); // toList() 없어도 됨.
  }
}
