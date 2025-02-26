import 'package:equatable/equatable.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/models/actor_character.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoaded extends MovieDetailState {
  final Movie movie;
  final List<ActorCharacter> actors;

  const MovieDetailLoaded(this.movie, [this.actors = const []]);

  @override
  List<Object> get props => [movie, actors];
}

class MovieDetailError extends MovieDetailState {
  final String error;

  const MovieDetailError(this.error);

  @override
  List<Object> get props => [error];
}