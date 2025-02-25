import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_bloc.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_event.dart';
import 'package:flutter_technical_test/blocs/movie_list/movie_list_state.dart';
import 'package:flutter_technical_test/models/movie.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    const double containerRadius = 12.5;
    double unit = MediaQuery.of(context).size.width / 15;
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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: unit),
              child: GridView.builder(
                padding: EdgeInsets.only(top: unit),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: unit,
                  mainAxisSpacing: unit,
                ),
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return Column(
                    children: [
                      SizedBox(height: index.isOdd ? unit : 0),
                      Expanded(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(containerRadius),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 18.5,
                                  right: 18.5,
                                  bottom: 18.5,
                                  top: 37,
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
                                      style: const TextStyle(
                                        fontFamily: 'BalooTamma2',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.5,
                                      ),
                                    ),
                                    Text(
                                      '${movie.rating}% User Score',
                                      style: const TextStyle(
                                        fontFamily: 'BalooTamma2',
                                        color: Colors.white,
                                        fontSize: 9.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (state is MovieListError) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}