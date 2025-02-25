/*import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/actor_with_role.dart';

class ActorCard extends StatelessWidget {
  final ActorWithRole actorWithRole;

  const ActorCard({
    required this.actorWithRole,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double containerRadius = 12.5;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(containerRadius),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${actorWithRole.actor.profilePath}',
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          actorWithRole.actor.name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          actorWithRole.character,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}*/