import 'package:app_filmes/modules/movie_detail/movie_detail_bindings.dart';
import 'package:app_filmes/modules/movie_detail/movie_detail_page.dart';
import 'package:get/get.dart';

import '../../application/modules/module.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings(),
    )
  ];
}
