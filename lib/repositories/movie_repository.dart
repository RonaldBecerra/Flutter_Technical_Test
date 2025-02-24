import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_technical_test/models/movie.dart';
import 'package:flutter_technical_test/models/actor.dart';

class MovieRepository {
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) { // Success
      final jsonResponse = json.decode(response.body);
      final movies = (jsonResponse['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
      return movies;
    } else { // Failure
      throw Exception('Error fetching movies');
    }
  }

  Future<Movie> fetchMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Movie.fromJson(jsonResponse);
    } else {
      throw Exception('Error fetching movie details');
    }
  }

  Future<List<Actor>> fetchMovieCredits(int movieId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final actors = (jsonResponse['cast'] as List)
          .map((actorJson) => Actor.fromJson(actorJson))
          .toList();
      return actors;
    } else {
      throw Exception('Error fetching movie credits');
    }
  }
}