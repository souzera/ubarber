import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubarber_app/src/modules/barbearias/barber.dart';

class BarberController extends GetxController {
  late final Barbearia _barbearia;

  @override
  void onInit() {
    super.onInit();
    _barbearia = Barbearia(
      id: _barbearia.id, 
      nome: _barbearia.nome, 
      user: _barbearia.user, 
      whatsapp: _barbearia.whatsapp, 
      local: _barbearia.local, 
      horarios: _barbearia.horarios);
  }
}
