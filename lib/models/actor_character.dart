class ActorCharacter {
  final int id;
  final String name;
  final String profilePath;
  final String character;

  ActorCharacter({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory ActorCharacter.fromJson(Map<String, dynamic> json) {
    return ActorCharacter(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'] ?? '',
      character: json['character'] ?? '',
    );
  }
}