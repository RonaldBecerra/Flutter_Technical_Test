import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/blocs/user_profile/user_profile_bloc.dart';
import 'package:flutter_technical_test/blocs/user_profile/user_profile_event.dart';
import 'package:flutter_technical_test/blocs/user_profile/user_profile_state.dart';
import 'package:flutter_technical_test/models/actor.dart';
import 'package:flutter_technical_test/views/widgets/movie_columns.dart';

class ProfileView extends StatelessWidget {
  final int actorId;

  const ProfileView({
    required this.actorId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Container(
          margin: const EdgeInsets.only(
            top: 20.0,
          ),
          color: Colors.white,  // White background for the header
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,  // No shadow
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.only(left: 25.0),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Transform.scale(
                    scale: 0.9,
                    child: const Image(
                      image: AssetImage('assets/icons/down_icon.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: _loadActorProfile(context),
    );
  }

  _loadActorProfile(BuildContext context){
    // The next three lines were added to avoid a problem that it only loaded
    // the information of an actor, and then it didn't load new info for other
    // actors; always kept the previous info.
    final userProfileBloc = context.read<UserProfileBloc>();
    userProfileBloc.add(ResetUserProfile());
    userProfileBloc.add(FetchUserProfile(actorId));

    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileInitial) {
          context.read<UserProfileBloc>().add(FetchUserProfile(actorId));
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoaded) {
          return ActorProfile(actor: state.actor);
        } else if (state is UserProfileError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class ActorProfile extends StatelessWidget {
  final Actor actor;

  const ActorProfile({
    required this.actor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w500${actor.profilePath}'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${actor.name}\n',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 19,
                            height: 1.3,
                          ),
                        ),
                        TextSpan(
                          text: actor.biography,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 10,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Casted on',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          // List of movies
          const SizedBox(height: 16),
          MovieColumns(movies: actor.movies),
        ],
      ),
    );
  }
}
