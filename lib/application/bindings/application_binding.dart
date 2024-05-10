import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/repositories/login/login_repository_impl.dart';
import 'package:app_filmes/service/login/login_service.dart';
import 'package:app_filmes/service/login/login_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  //tudo que é permanente e nao morre no sistema 
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(),fenix: true);
    //feniz true vai fzr com que o get nao mate a instacia e matenha no ar
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()), fenix: true);
  }
}