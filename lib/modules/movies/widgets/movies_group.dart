import 'package:app_filmes/application/ui/widget/movie_card.dart';
import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/movie_model.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  //receber informações dos movies
  final List<MovieModel> movies;

  const MoviesGroup({super.key, required this.title, required this.movies});

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
          // Container(

          //   color: Colors.red,
          //   height: 280,
             Obx(
               () {
                 return movies.isEmpty
                     ? const Center(child: CircularProgressIndicator.adaptive())
                     : CarouselSlider.builder(
                     
                         itemCount: movies.length,
                         options: CarouselOptions(
                           scrollDirection: Axis.horizontal,
                           autoPlay: true,
                           height: 280,
                           enlargeCenterPage: false,
                           aspectRatio: 16 / 9,
                           viewportFraction: 0.8,
                           
                           autoPlayAnimationDuration:
                               const Duration(milliseconds: 800),
                         ),
                         itemBuilder: 
                             (BuildContext context, int index, int realIndex) {
                           var movie = movies[index];
                                   
                           return MovieCard(
                             movie: movie,
                             favoriteCallback: () =>
                                 controller.FavoriteMovie(movie),
                           );
                         },
                       );
               },
             ),
          
        ],
      ),
    );
  }
}

// return ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: movies.length,
//                 itemBuilder: (context, index) {
//                   var movie = movies[index];
//                   return MovieCard(
//                     movie: movie,
//                     favoriteCallback: () => controller.FavoriteMovie(movie),
//                   );
//                 },
//               );


// CarouselSlider.builder(
//                         itemCount: movies.length,
//                         options: CarouselOptions(
//                           scrollDirection: Axis.horizontal,
//                           autoPlay: true,
//                           height: 280,
//                           enlargeCenterPage: false,
                          
//                           autoPlayAnimationDuration:
//                               const Duration(milliseconds: 800),
//                         ),
//                         itemBuilder:
//                             (BuildContext context, int index, int realIndex) {
//                           var movie = movies[index];

//                           return MovieCard(
//                             movie: movie,
//                             favoriteCallback: () =>
//                                 controller.FavoriteMovie(movie),
//                           );
//                         },
//                       );