import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();
}

class FetchMovies extends MovieListEvent {
  @override
  List<Object> get props => [];
}