import 'package:card_play/data/data_source/user_api.dart';
import 'package:card_play/domain/model/user.dart';
import 'package:card_play/domain/repository/user_repository.dart';

class UserApiRepositoryImpl implements UserApiRepository {
 final UserApi userApi;
  UserApiRepositoryImpl(this.userApi);
  
  @override
  Future<List<User>> fetch() async{
    final result =await userApi.loadUsers();
    return result;
  }
}