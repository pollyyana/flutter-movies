import 'package:app_filmes/application/ui/widget/movie_card.dart';
import 'package:app_filmes/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // nao coloca o item de back
        automaticallyImplyLeading: false,
        title: const Text('Favoritos'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (m) => MovieCard(
                      movie: m,
                      favoriteCallback: () => controller.removeFavorite(m),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
