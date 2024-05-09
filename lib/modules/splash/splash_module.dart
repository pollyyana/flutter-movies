import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/splash/splash_binding.dart';
import 'package:app_filmes/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      // binding: vai ter o controle da pagina, qnd carrega e nao carrega, ele diz qnd  vai carregar splash page, entao antes do get executar ele vai executar o metodo do biding, para popular ttoda caixa de instacias...
      binding: SplashBinding(),
    ),
  ];
}
