import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/views/widgets/movie_card.dart';

class MovieColumns extends StatelessWidget {
  final List<Movie> movies;

  const MovieColumns({
    required this.movies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double unit = MediaQuery.of(context).size.width / 15;

    List<Widget> buildMovieColumn(List<Movie> movies, double topOffset) {
      return [
        SizedBox(height: topOffset),
        for (var movie in movies)
          MovieCard(movie: movie, unit: unit),
      ];
    }

    final List<Movie> leftColumnMovies = [];
    final List<Movie> rightColumnMovies = [];
    for (int i = 0; i < movies.length; i++) {
      if (i % 2 == 0) {
        leftColumnMovies.add(movies[i]);
      } else {
        rightColumnMovies.add(movies[i]);
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: unit),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Column(children: buildMovieColumn(leftColumnMovies, 0))),
          SizedBox(width: unit),
          Expanded(child: Column(children: buildMovieColumn(rightColumnMovies, unit))),
        ],
      ),
    );
  }
}
