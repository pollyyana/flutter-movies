import 'package:app_filmes/modules/movie_detail/widget/movie_detail_content/movie_detail_content_credits.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_detail_content/movie_detail_content_main_cast.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_detail_content/movie_detail_content_production_companies.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_detail_content/movie_detail_content_title.dart';
import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContentCredits(movie: movie),
        MovieDetailContentProductionCompanies(movie: movie),
        MovieDetailContentMainCast(movie: movie),
      ],
    );
  }
}
