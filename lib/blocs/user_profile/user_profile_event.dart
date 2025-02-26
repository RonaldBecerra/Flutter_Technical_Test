import 'package:equatable/equatable.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class FetchUserProfile extends UserProfileEvent {
  final int actorId;

  const FetchUserProfile(this.actorId);

  @override
  List<Object> get props => [actorId];
}

class ResetUserProfile extends UserProfileEvent {
  @override
  List<Object> get props => [];
}