// ignore_for_file: avoid_print

import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/service/genres/genres_service.dart';
import 'package:app_filmes/service/movies/movies_service.dart';
import 'package:get/get.dart';

import '../../models/movie_model.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _message = Rxn<MessagesModel>();
  //guardar na variavel
  final genres = <GenreModel>[].obs;
  //fazer a busca do movies 
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  final _popularMoviesOriginal = <MovieModel>[];
  final _topRatedMoviesOriginal = <MovieModel>[];

  MoviesController( {required GenresService genresService, required MoviesService moviesService})
      : _genresService = genresService, _moviesService = moviesService;

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
      final genres = await _genresService.getGenres();
      //assignAll buca todos os dados e subscreve tudo que esta na lista GETX
     this.genres.assignAll(genres);

     //fazer as buscas dos movies
    final popularMoviesData = await _moviesService.getPopularMovies();
    final topRatedMoviesData = await _moviesService.getPopularMovies();
    //atribuição
    popularMoviesData.assignAll(popularMoviesData);
    topRatedMoviesData.assignAll(topRatedMoviesData);


    } catch (e, s) {
      print(e);
      print(s);
      _message(MessagesModel.error(
          title: 'erro', message: 'Erro ao carregar dados da pagina'));
    }
  }
}
