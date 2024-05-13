import 'package:app_filmes/application/ui/widget/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesGroup extends StatelessWidget {
  final String title;

  const MoviesGroup({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index){
                return MovieCard();
            }),
          )
        ],
      ),
    );
  }
}
