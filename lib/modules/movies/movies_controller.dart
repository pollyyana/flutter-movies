import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/service/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessagesModel>();
  //guardar na variavel
  final genres = <GenreModel>[].obs;

  MoviesController({required GenresService genresService})
      : _genresService = genresService;

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
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessagesModel.error(
          title: 'erro', message: 'Erro ao buscar Categorias'));
    }
  }
}
