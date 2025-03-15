import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_flutterapp/providers/movie_provider.dart';
import 'package:tmdb_flutterapp/widgets/movie_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        final movieProvider = Provider.of<MovieProvider>(
          context,
          listen: false,
        );
        movieProvider.fetchMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App de peliculas")),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (movieProvider.movies.isEmpty) {
            return const Center(child: Text('No hay películas disponibles'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.movies[index];
                return MovieItem(movie: movie);
              },
            );
          }
        },
      ),
    );
  }
}
