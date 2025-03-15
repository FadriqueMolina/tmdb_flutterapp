import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_flutterapp/providers/movie_provider.dart';
import 'package:tmdb_flutterapp/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MovieProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "Movies app",
    );
  }
}
