// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:app_filmes/service/login/login_service.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;

  //suporte para sair da pagina
  final LoginService _loginService;
  //receber no contrutor e fzr atribuiçao
  HomeController({required LoginService loginService})
      : _loginService = loginService;


  final _pages = ['/movies', '/favorites'];

//controlar a cor do icons com obs
  final _pageIndex = 0.obs;
//encapsulando pageindex
  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}

  //teste
 // void goToPage(int page){
  //   _pageIndex(page);
  //   if (page == 1) {
  //     Get.offNamed('/favorites', id: NAVIGATOR_KEY);
  //   }else if (page == 0) {
  //     Get.offNamed('/movies', id: NAVIGATOR_KEY);
  //   }
  // }