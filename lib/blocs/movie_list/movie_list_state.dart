import 'package:equatable/equatable.dart';
import 'package:your_app/models/movie.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
}

class MovieListInitial extends MovieListState {
  @override
  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {
  @override
  List<Object> get props => [];
}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;

  const MovieListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieListError extends MovieListState {
  final String error;

  const MovieListError(this.error);

  @override
  List<Object> get props => [error];
}