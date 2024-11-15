import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final Map<String, String> movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(movie['posterPath']!),
              SizedBox(height: 20),
              Text(
                movie['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                movie['releaseDate']!,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              // Add more movie details here if needed
            ],
          ),
        ),
      ),
    );
  }
}
