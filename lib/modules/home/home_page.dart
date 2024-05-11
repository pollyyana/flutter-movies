import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:get/get.dart';

//responsavel por carregas a tela movies e favoritos

class HomePage extends GetView<HomeController> {
  //GetView<HomeController> pra adc a controller
  // ou controller = Get.find()..
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty),
                label: 'Favorites',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.login_outlined),
                label: 'Sair',
                backgroundColor: Colors.black),
          ],
        );
      }),
      //controlando a navegação o ongenerat... encapsula a rota principal
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(1),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              //settings que acabou de receber
              settings: settings,
              page: () => const MoviesPage(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }

          return null;
        },
      ),
    );
  }
}
