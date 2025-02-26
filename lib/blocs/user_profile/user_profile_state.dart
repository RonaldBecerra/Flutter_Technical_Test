import 'package:equatable/equatable.dart';
import 'package:flutter_technical_test/models/actor.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class UserProfileInitial extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoaded extends UserProfileState {
  final Actor actor;

  const UserProfileLoaded(this.actor);

  @override
  List<Object> get props => [actor];
}

class UserProfileError extends UserProfileState {
  final String error;

  const UserProfileError(this.error);

  @override
  List<Object> get props => [error];
}