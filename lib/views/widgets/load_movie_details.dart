import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_event.dart';
import 'package:flutter_technical_test/blocs/movie_detail/movie_detail_state.dart';
import 'package:flutter_technical_test/views/widgets/actors_row.dart';

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
          return ActorsRow(movie: movie, actors: state.actors);
        } else if (state is MovieDetailError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox.shrink();
      }
    );
  }
}