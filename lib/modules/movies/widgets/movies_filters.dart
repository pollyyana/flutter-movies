import 'package:app_filmes/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            children: controller.genres.map((g) => const FilterTag()).toList(),
          );
        }),
      ),
    );
  }
}
