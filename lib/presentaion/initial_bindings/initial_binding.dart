import 'package:card_play/data/data_source/user_api.dart';
import 'package:card_play/data/repository_impl/user_api_repository_impl.dart';
import 'package:card_play/domain/model/user.dart';
import 'package:card_play/domain/repository/user_repository.dart';
import 'package:card_play/presentaion/controller/user_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut<UserApiRepository>(() => UserApiRepositoryImpl(Get.find<UserApi>()));
    Get.lazyPut(() => UserController(Get.find<UserApiRepository>()));
  }
}
