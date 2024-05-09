import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:get/get.dart';
class LoginController extends GetxController with LoaderMixin{

  final  loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
  }

  Future<void> login() async {
    // aparece ou nao aparecer qnd o loader for clicado
    // loading.value = true;
    loading(true);
    //Get
    await 2.seconds.delay();
    // await Future.delayed(Duration(seconds: 2));

    loading(false);
  }
  
}