class Movie {
  final int id;
  final String title;
  final int rating;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title available',
      posterPath: json['poster_path'] ?? '',
      rating: ((json['vote_average'] ?? 0) * 10).round(),
    );
  }
}