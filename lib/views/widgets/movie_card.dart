import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/views/detail_view.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double containerRadius = 12.5;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailView(movie: movie),
        ));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(containerRadius),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 10,
                top: 21,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(containerRadius),
                  bottomRight: Radius.circular(containerRadius),
                ),
                color: Colors.black.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${movie.rating}% User Score',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}