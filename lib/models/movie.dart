class Movie {
  final int id;
  final String title;
  final double rating;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      rating: (json['vote_average'] * 100).toDouble(), // TODO: ¿Por qué toDouble?
    );
  }
}