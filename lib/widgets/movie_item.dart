import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(movie.posterUrl, fit: BoxFit.cover),
          ), //Me podrias recordar que es un expanded???
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
