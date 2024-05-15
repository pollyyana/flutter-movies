// ignore_for_file: avoid_print

import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient}): _restClient = restClient;
  @override
  Future<List<MovieModel>> getPopularMovies() async{
   final result = await _restClient.get<List<MovieModel>>(
    '/movie/popular',
    query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    },
    decoder: (data) {
      final result = data ['result'];
      if (result != null) {
        return result.map((vid) => MovieModel.fromMap(vid)).toList();
      }
      return <MovieModel>[];
    },
   );
   if (result.hasError) {
     print('Erro a o buscar popular movies [${result.statusCode}]');
     throw Exception('Erro ao buscar filmes populares');
   }
   //se tudo deu certo 
   return result.body ??<MovieModel> [];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
   final result = await _restClient.get<List<MovieModel>>(
    '/movie/top_rated',
    query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    },
    decoder: (data) {
      final result = data ['result'];
      if (result != null) {
        return result.map((vid) => MovieModel.fromMap(vid)).toList();
      }
      return <MovieModel>[];
    },
   );
   if (result.hasError) {
     print('Erro a o buscar popular movies [${result.statusCode}]');
     throw Exception('Erro ao buscar filmes populares');
   }
   //se tudo deu certo 
   return result.body ??<MovieModel> [];
  }

}