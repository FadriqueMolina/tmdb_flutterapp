import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService = MovieService();
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await _movieService.fetchPopularMovies();
    } catch (e) {
      //Manejar el error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
