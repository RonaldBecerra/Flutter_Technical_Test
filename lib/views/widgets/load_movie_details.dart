import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_event.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_state.dart';

class LoadMovieDetails extends StatelessWidget {
  final Movie movie;

  const LoadMovieDetails({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailInitial) {
          context.read<MovieDetailBloc>().add(FetchMovieDetail(movie.id));
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MovieDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieDetailLoaded) {
          return Positioned(
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
              color: Colors.black.withOpacity(0.2),
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
                  Row(
                    children: state.actors
                        .take(3)
                        .map((actor) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${actor.profilePath}'
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                ],
              ),
            ),
          );;
        } else if (state is MovieDetailError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox.shrink();
      }
    );
  }
}