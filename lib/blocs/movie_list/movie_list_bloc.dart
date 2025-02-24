import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/repositories/movie_repository.dart';
import 'movie_list_event.dart';
import 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRepository movieRepository;

  MovieListBloc(this.movieRepository) : super(MovieListInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieListLoading());
      try {
        final movies = await movieRepository.fetchMovies();
        emit(MovieListLoaded(movies));
      } catch (e) {
        emit(MovieListError(e.toString()));
      }
    });
  }
}