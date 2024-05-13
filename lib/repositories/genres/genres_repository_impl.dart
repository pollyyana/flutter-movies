// ignore_for_file: avoid_print

import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = RestClient();

//metodo que é a busca de todos os caras/acesso ao serviço
  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language' : 'pt-br'
      },
      // CONVERTER A STRING E SE TORNAR UM MODELO
      decoder: (data) {
        final resultData = data['genres'];
        //verifica se e nulo
        if (resultData != null) {
          //loop convertendo o cara
          //map vai tranformar a lista de chave e valor no modelo
          return resultData
              .map<GenreModel>((g) => GenreModel.fromMap(g))
              .toList();
        }
        //caso seja null retorna  array vazio
        return <GenreModel>[];
      },
    );

    //verificar se tem erro
    if (result.hasError) {
      //printa code do erro
      print('Erro aobuscar genres [${result.statusCode}]');
      print(result.statusText);
      throw Exception('Erro ao buscar Genres');
    }
    return result.body ?? <GenreModel>[];
  }
}
//camada de negocio em service
