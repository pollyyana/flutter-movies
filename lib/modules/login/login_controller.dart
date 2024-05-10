import 'package:get/get.dart';

import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/service/login/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;

  final loading = false.obs;
  final message = Rxn<MessagesModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  //esculta as paradas
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messagesListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessagesModel.info(
            title: 'Sucesso', message: 'Login realizado com sucesso'),
      );
    } catch (e, s) {
      print(e);
      print(s);
      //tirar o loader antes de mostrar a menssagem de erro
      loading(false);
      message(
        MessagesModel.error(
            title: 'Erro ao relaizar Login', message: 'Erro ao realizar login'),
      );
    }
  }
}

// teste
// Future<void> login() async {
    // aparece ou nao aparecer qnd o loader for clicado
    // loading.value = true;
//     loading(true);
    //Get
//     await 2.seconds.delay();
    //dart
    // await Future.delayed(Duration(seconds: 2));
//     loading(false);
//     message(MessagesModel.error(
//       title: 'Titulo Error',
//       message: 'Mensagem de erro',
//     ));
//     await 1.seconds.delay();

//     message(MessagesModel.info(
//       title: 'Titulo Info',
//       message: 'Mensagem de Info',
//     ));
//   }