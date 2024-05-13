import 'package:app_filmes/models/genre_model.dart';

abstract interface class GenresRepository {

//metodo
Future<List<GenreModel>> getGenres();
}