import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/ui/widget/movie_card.dart';
import '../../../models/movie_model.dart';
import '../movies_controller.dart';

class MoviesTopRated extends GetView<MoviesController> {
  final String title;
  //receber informações dos movies
  final List<MovieModel> movies;

  const MoviesTopRated({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            // color: Colors.red,
            height: 280,
            child: Obx(
              () {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    var movie = movies[index];
                    return MovieCard(
                      movie: movie,
                      favoriteCallback: () => controller.FavoriteMovie(movie),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
