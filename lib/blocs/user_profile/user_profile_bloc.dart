import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/repositories/movie_repository.dart';
import 'user_profile_event.dart';
import 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final MovieRepository movieRepository;

  UserProfileBloc(this.movieRepository) : super(UserProfileInitial()) {
    on<FetchUserProfile>((event, emit) async {
      emit(UserProfileLoading());
      try {
        final actor = await movieRepository.fetchActorDetails(event.actorId);
        emit(UserProfileLoaded(actor));
      } catch (e) {
        emit(UserProfileError(e.toString()));
      }
    });
  }
}