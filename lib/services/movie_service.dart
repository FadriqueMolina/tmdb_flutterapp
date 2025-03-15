import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  final String _apiKey = "1ea414737796d7d04742a3f04ad569b0";

  Future<List<Movie>> fetchPopularMovies() async {
    final url = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=es-MX&page=1",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<dynamic> results = data["results"];

      return results
          .map(
            (movie) => Movie(
              id: movie['id'],
              title: movie['title'],
              overview: movie['overview'],
              posterPath: movie['poster_path'],
              voteAverage: movie['vote_average'].toDouble(),
            ),
          )
          .toList();
    } else {
      throw Exception('Error al cargar las películas');
    }
  }
}
