import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_test/blocs/user_profile/user_profile_bloc.dart';
import 'package:flutter_technical_test/blocs/user_profile/user_profile_event.dart';
import 'package:flutter_technical_test/blocs/user_profile/user_profile_state.dart';
import 'package:flutter_technical_test/models/actor.dart';

class ProfileView extends StatelessWidget {
  final int actorId;

  const ProfileView({required this.actorId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95.0),
        child: Container(
          margin: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
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
                child: const Image(
                  image: AssetImage('assets/icons/down_icon.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
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
      ),
    );
  }
}

class ActorProfile extends StatelessWidget {
  final Actor actor;

  const ActorProfile({required this.actor, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w500${actor.profilePath}'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              actor.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Biography",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(
            actor.biography.isNotEmpty ? actor.biography : "No biography available.",
          ),
          const SizedBox(height: 16),
          Text(
            "Movies",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Column(
            children: actor.movies
                .map((movie) => ListTile(
              title: Text(movie),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}