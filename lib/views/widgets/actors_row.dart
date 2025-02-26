import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_technical_test/models/actor_character.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/views/widgets/generic_card.dart';
import 'package:flutter_technical_test/views/profile_view.dart';

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
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
              top: 12,
            ),
            color: Colors.black.withOpacity(0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: movie.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: '\n${movie.rating}% User Score',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: actors.take(3).map((actor) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: GenericCard(
                          kind: 1,
                          imgSrc: 'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                          text1: actor.name,
                          text2: actor.character,
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType.rotate,
                                alignment: Alignment.center,
                                duration: const Duration(milliseconds: 600),
                                child: ProfileView(actorId: actor.id),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}