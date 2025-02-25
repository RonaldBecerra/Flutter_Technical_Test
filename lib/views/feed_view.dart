import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_event.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_state.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/views/widgets/movie_columns.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.movie),
        title: const Text(
          'Latest',
          style: TextStyle(
            fontFamily: 'BalooTamma2',
            fontWeight: FontWeight.w800,
            fontSize: 26.0,
          ),
        ),
      ),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListInitial) {
            context.read<MovieListBloc>().add(FetchMovies());
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieListLoaded) {
            return MovieColumns(movies: state.movies);
          } else if (state is MovieListError) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}