import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/actor_character.dart';
import 'package:flutter_technical_test/models/movie.dart';

class ActorsRow extends StatelessWidget {
  final Movie movie;
  final List<ActorCharacter> actors;

  const ActorsRow({
    required this.movie,
    required this.actors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.32;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: containerHeight,
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 10,
              top: 21,
            ),
            color: Colors.black.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text(
                  '${movie.rating}% User Score',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: actors
                      .take(3)
                      .map((actor) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${actor.profilePath}'
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}