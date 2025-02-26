import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_event.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_state.dart';
import 'package:flutter_technical_test/views/widgets/movie_columns.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95.0),
        child: Container(
          margin: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          color: Colors.white,  // White background for the header
          child: AppBar(
            // Transparent background for the internal AppBar
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,  // No shadow
            leading: Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.only(left: 25.0),
              child: Transform.scale(
                scale: 0.9,
                child: const Image(image: AssetImage('assets/icons/hamburger_icon.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            title: const Text(
              'Latest',
              style: TextStyle(
                fontFamily: 'BalooTamma2',
                fontWeight: FontWeight.w800,
                fontSize: 26.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: _loadMovies(context),
    );
  }

  _loadMovies(BuildContext context){
    return BlocBuilder<MovieListBloc, MovieListState>(
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
    );
  }
}