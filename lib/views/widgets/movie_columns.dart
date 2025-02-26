import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/views/widgets/generic_card.dart';
import 'package:flutter_technical_test/views/detail_view.dart';

class MovieColumns extends StatelessWidget {
  final List<Movie> movies;

  const MovieColumns({
    required this.movies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double unit = MediaQuery.of(context).size.width / 15;

    List<Widget> buildMovieColumn(List<Movie> movies, double topOffset) {
      return [
        SizedBox(height: topOffset),
        for (var movie in movies)
          Padding(
            padding: EdgeInsets.only(bottom: unit),
            child: GenericCard(
              kind: 0,
              imgSrc: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              text1: movie.title,
              text2: '${movie.rating}% User Score',
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.topToBottom,
                    child: DetailView(movie: movie),
                  ),
                );
              },
            )
          )
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

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: unit),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Column(children: buildMovieColumn(leftColumnMovies, 0))),
            SizedBox(width: unit),
            Expanded(child: Column(children: buildMovieColumn(rightColumnMovies, unit))),
          ],
        ),
      ),
    );
  }
}
