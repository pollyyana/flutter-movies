import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';

import './genres_service.dart';

class GenresServiceImpl implements GenresService {

  
  final GenresRepository _genresRepository;

  GenresServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  // esse metodo faz apenas um proxy
  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}

//recuperar na controller
