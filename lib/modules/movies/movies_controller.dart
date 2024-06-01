// ignore_for_file: avoid_print

import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/service/genres/genres_service.dart';
import 'package:app_filmes/service/movies/movies_service.dart';
import 'package:get/get.dart';

import '../../models/movie_model.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessagesModel>();
  //guardar na variavel
  final genres = <GenreModel>[].obs;
  //fazer a busca do movies

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  //genero selecionado
  final genreSelected = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  //metodo para recuperar generos
  // List<GenreModel> get genres => _genres;

  @override
  void onInit() {
    super.onInit();
    messagesListener(_message);
  }

  //ciclo de vida, qnd  atela estiver pronta vai fazer a busca dos dados
  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresService.getGenres();
      //assignAll buca todos os dados e subscreve tudo que esta na lista GETX
      genres.assignAll(genresData);

      //   //fazer as buscas dos movies
      //   final popularMoviesData = await _moviesService.getPopularMovies();
      //   final topRatedMoviesData = await _moviesService.getTopRated();

      //   //atribuição
      //   //popular as listas
      //   popularMovies.assignAll(popularMoviesData);
      //   _popularMoviesOriginal = popularMoviesData;
      //   topRatedMovies.assignAll(topRatedMoviesData);
      //   _topRatedMoviesOriginal = topRatedMoviesData;

      await getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessagesModel.error(
          title: 'erro', message: 'Erro ao carregar dados da pagina'));
    }
  }

  Future<void> getMovies() async {
    try {
      //fazer as buscas dos movies
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRated();
      final favorites = await getFavorities();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      //atribuição
      //popular as listas
      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessagesModel.error(
          title: 'erro', message: 'Erro ao carregar dados da pagina'));
    }
  }

  //metodo
  //filtro dentro das listas no buscar
  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPoularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      //nova lista
      // where vai filtrar a lista
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      //subscreve a lista por essa nova lista
      popularMovies.assignAll(newPoularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  //filtro da categoria
  void filterMoviesByGenre(GenreModel? genreModel) {
    //filter ja foi selecionado?
    var genreFilter = genreModel;
    // se genre filter nao for nulo, pega o id e comparada genre selected
    // se clicar seleciona, se clicar de novo tira a seleçao
    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }
    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPoularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      popularMovies.assignAll(newPoularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> FavoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorities() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
