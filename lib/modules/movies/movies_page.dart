import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/modules/movies/widgets/movies_filters.dart';
import 'package:app_filmes/modules/movies/widgets/movies_group.dart';
import 'package:app_filmes/modules/movies/widgets/movies_header.dart';
import 'package:app_filmes/modules/movies/widgets/movies_top_rated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//movies page precisa de acesso a controller
class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      child: ListView(
        children: [
          const MoviesHeader(),
          const MoviesFilters(),
          SizedBox(
            width: double.infinity,
            child: MoviesGroup(
              title: ' Mais populares',
              movies: controller.popularMovies,
            ),
          ),
          //controller ṕassando os dados para o grupo
          MoviesTopRated(
            title: ' Top filmes',
            movies: controller.topRatedMovies,
          ),
        ],
      ),
    );
  }
}
