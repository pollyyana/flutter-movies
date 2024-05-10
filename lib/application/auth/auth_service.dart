//Classe de servço onde yudo que precisa de identificação vai nela
// precisa do usario logado, pede pra ela
//ela tbm vai ficar escultando se o login foi alterado

// import 'package:get/route_manager.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  //get service e como um guiche
  //guardar o s dados do usuario
  User? user;

  //init metodo de inicialização
  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //se for igual a null o usuario nao esta logado
      this.user = user;
      if (user == null ) {
        Get.offAllNamed('/login');
      }else {
        Get.offAllNamed('/home');
      }
    });
  }
}
