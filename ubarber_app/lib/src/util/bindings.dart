import 'package:get/get.dart';
import 'package:ubarber_app/src/modules/usuario/get-user.dart';
import 'package:ubarber_app/src/modules/usuario/user-repository.dart';
import 'package:ubarber_app/src/util/controller.dart';

class HttpBindings implements Bindings {
  @override
  void dependencies() {

    Get.put<IUserRepository>(UserController());
    Get.put(HttpController(Get.find()));
  }
}
