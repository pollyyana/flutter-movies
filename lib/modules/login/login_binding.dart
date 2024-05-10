import 'package:app_filmes/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    //lazyput ainda nao instaciado. qnd precisar ele e usado
    Get.lazyPut(() => LoginController(loginService: Get.find()));
    //o tet vai instaciar o service apartir do login controller?
    //service e repository sera adiconado em um binding generico mais amplo
    //application binding = tudo que e customizado ou compartilhado
    //agr adc o login service

  }
}