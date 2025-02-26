import 'movie.dart';

class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String biography;
  final List<Movie> movies;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.biography,
    required this.movies,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    List<Movie> moviesList = [];
    if (json['movie_credits'] != null && json['movie_credits']['cast'] != null) {
      moviesList = (json['movie_credits']['cast'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
    }

    return Actor(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      profilePath: json['profile_path'] ?? '',
      biography: json['biography'] ?? 'No biography available.',
      movies: moviesList,
    );
  }
}