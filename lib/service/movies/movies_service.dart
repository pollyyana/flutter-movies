import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';

abstract interface class MoviesService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
}
