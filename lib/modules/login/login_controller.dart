import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessagesModel>();

  @override
  //esculta as paradas
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messagesListener(message);
  }

  Future<void> login() async {
    // aparece ou nao aparecer qnd o loader for clicado
    // loading.value = true;
    loading(true);
    //Get
    await 2.seconds.delay();
    //dart
    // await Future.delayed(Duration(seconds: 2));
    loading(false);
    message(MessagesModel.error(
      title: 'Titulo Error',
      message: 'Mensagem de erro',
    ));
    await 1.seconds.delay();

    message(MessagesModel.info(
      title: 'Titulo Info',
      message: 'Mensagem de Info',
    ));
  }
}
