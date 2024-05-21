import 'package:app_filmes/models/movie_detail_model.dart';

import '../../models/movie_model.dart';

abstract interface class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
}
