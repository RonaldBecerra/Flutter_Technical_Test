import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/repositories/movie_repository.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailBloc(this.movieRepository) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final movie = await movieRepository.fetchMovieDetails(event.movieId);
        final actors = await movieRepository.fetchMovieCredits(event.movieId);
        emit(MovieDetailLoaded(movie, actors));
      } catch (e) {
        emit(MovieDetailError(e.toString()));
      }
    });
  }
}