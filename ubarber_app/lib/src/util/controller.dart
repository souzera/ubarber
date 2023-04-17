// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:ubarber_app/src/modules/usuario/user-repository.dart';

class HttpController extends GetxController with StateMixin {
  final IUserRepository _httpRepository;

  HttpController(this._httpRepository);

  @override
  void onInit() {
    super.onInit();
    findUsers();
  }

  void findUsers() async {
    change([], status: RxStatus.loading());
    try {
      final query = await _httpRepository.findAll();
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error("Erro ao buscar usuarios"));
    }
  }

  void findByUsername(username) async {
    change([], status: RxStatus.loading());
    try {
      final query = await _httpRepository.findUserByUsername(username);
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Error ao consultar usuario'));
    }
  }
}
