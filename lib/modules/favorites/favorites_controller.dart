import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/service/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  @override
onReady()  {
    super.onReady();
    _getFavorites();
  }
  
  Future<void> _getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movie)async{
     var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(user.uid, movie.copyWith(favorite: false));
      //pegar a lista e remover os movies que vieram aqui
      movies.remove(movie);
    }
  }
}
